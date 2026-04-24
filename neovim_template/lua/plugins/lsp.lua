return {
  -- LSP 서버 설치 관리자
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },

  -- mason <-> lspconfig 브릿지
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls", "pyright", "ts_ls",
          "yamlls",
          "jdtls",
          -- gopls:         brew install go 후 :MasonInstall gopls
          -- rust_analyzer: Rust 설치 후 :MasonInstall rust_analyzer
        },
        automatic_installation = true,
      })
    end,
  },

  -- LSP 설정 (nvim 0.11+ 새 API: vim.lsp.config / vim.lsp.enable)
  {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason-lspconfig.nvim", "hrsh7th/cmp-nvim-lsp" },
    config = function()
      -- cmp-nvim-lsp 확장 capabilities (문서, 스니펫, resolveSupport 등)
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- LSP 연결 시 키맵
      -- nvim 0.11+ built-in LSP keymaps: gd, K, grr, gri, grn, gra
      -- Only add keymaps not covered by defaults
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(ev)
          local map = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = ev.buf, desc = "LSP: " .. desc })
          end
          map("<leader>d",   vim.diagnostic.open_float,   "Diagnostics")
          map("[d",          function() vim.diagnostic.jump({ count = -1 }) end, "Previous diagnostic")
          map("]d",          function() vim.diagnostic.jump({ count = 1 }) end,  "Next diagnostic")
          vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help,
            { buffer = ev.buf, desc = "LSP: Signature help" })
        end,
      })

      -- 서버별 설정
      local servers = { "lua_ls", "pyright", "ts_ls", "yamlls" }
      for _, server in ipairs(servers) do
        vim.lsp.config(server, { capabilities = capabilities })
        vim.lsp.enable(server)
      end

      -- jdtls: Java 21+ 필요 (프로젝트는 하위 버전 유지 가능)
      local java21_home = vim.fn.trim(vim.fn.system("/usr/libexec/java_home -v 21 2>/dev/null"))
      if java21_home ~= "" then
        vim.lsp.config("jdtls", {
          capabilities = capabilities,
          cmd_env = { JAVA_HOME = java21_home },
        })
      else
        vim.lsp.config("jdtls", { capabilities = capabilities })
      end
      vim.lsp.enable("jdtls")
    end,
  },

  -- 함수 시그니처 자동 표시 (괄호 열면 파라미터 힌트 팝업)
  {
    "ray-x/lsp_signature.nvim",
    event = "LspAttach",
    opts = {
      bind = true,
      hint_enable = true,
      hint_prefix = "▸ ",
      handler_opts = { border = "rounded" },
      floating_window = true,
      floating_window_above_cur_line = true,
    },
  },

  -- 자동완성
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      cmp.setup({
        completion = {
          keyword_length = 0, -- trigger character (. : 등) 입력 즉시 완성 표시
        },
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-n>"] = cmp.mapping.select_next_item(),
          ["<C-p>"] = cmp.mapping.select_prev_item(),
          ["<C-d>"] = cmp.mapping.scroll_docs(4),
          ["<C-u>"] = cmp.mapping.scroll_docs(-4),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        }),
      })
    end,
  },
}
