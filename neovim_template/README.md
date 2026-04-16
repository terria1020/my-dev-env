# Neovim Template

Lua 기반 Neovim IDE 설정 템플릿. lazy.nvim 플러그인 매니저를 사용한다.

## 설치

### 사전 요구사항

- Neovim >= 0.10
- Git
- Node.js / npm (tree-sitter CLI 설치용)
- C 컴파일러 (telescope-fzf-native 빌드용)

### 원클릭 설치

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/terria1020/my-dev-env/main/neovim_setup.sh)
```

기존 설정이 있으면 `~/.config/nvim.bak.<timestamp>`로 백업한다.

### 수동 설치

```bash
# 기존 설정 백업
mv ~/.config/nvim ~/.config/nvim.bak

# 복사
mkdir -p ~/.config/nvim
cp -r neovim_template/* ~/.config/nvim/

# 플러그인 설치
nvim --headless "+Lazy! sync" +qa
```

## 파일 구조

```
~/.config/nvim/
  init.lua                  -- 진입점 (leader 키, lazy.nvim 부트스트랩, 컬러스킴)
  lua/
    options.lua             -- 에디터 옵션
    keymaps.lua             -- 기본 단축키
    plugins/
      telescope.lua         -- 파일/텍스트 검색 (fuzzy finder)
      explorer.lua          -- 파일 탐색기 (neo-tree)
      lsp.lua               -- LSP, 자동완성 (mason + nvim-cmp)
      treesitter.lua        -- 구문 강조 (treesitter)
```

## 플러그인 목록

| 플러그인 | 용도 |
|----------|------|
| [lazy.nvim](https://github.com/folke/lazy.nvim) | 플러그인 매니저 |
| [vscode.nvim](https://github.com/Mofiqul/vscode.nvim) | VS Code 다크 테마 |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | 상태바 |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | 퍼지 파인더 |
| [telescope-fzf-native](https://github.com/nvim-telescope/telescope-fzf-native.nvim) | fzf 정렬 알고리즘 |
| [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim) | 파일 탐색기 |
| [mason.nvim](https://github.com/williamboman/mason.nvim) | LSP 서버 설치/관리 |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | LSP 설정 |
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) | 자동완성 |
| [LuaSnip](https://github.com/L3MON4D3/LuaSnip) | 스니펫 엔진 |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | 구문 강조 |

## 단축키

> Leader 키: `Space`

### 일반

| 단축키 | 모드 | 동작 |
|--------|------|------|
| `Space w` | Normal | 저장 |
| `Space q` | Normal | 종료 |
| `Esc` | Normal | 검색 하이라이트 해제 |

### 창 이동

| 단축키 | 동작 |
|--------|------|
| `Ctrl+h` | 왼쪽 창으로 이동 |
| `Ctrl+l` | 오른쪽 창으로 이동 |
| `Ctrl+j` | 아래쪽 창으로 이동 |
| `Ctrl+k` | 위쪽 창으로 이동 |

### 버퍼

| 단축키 | 동작 |
|--------|------|
| `Shift+l` | 다음 버퍼 |
| `Shift+h` | 이전 버퍼 |
| `Space bd` | 버퍼 삭제 |

### 줄 이동

| 단축키 | 모드 | 동작 |
|--------|------|------|
| `Alt+j` | Normal / Visual | 줄을 아래로 이동 |
| `Alt+k` | Normal / Visual | 줄을 위로 이동 |

### 들여쓰기

| 단축키 | 모드 | 동작 |
|--------|------|------|
| `<` | Visual | 들여쓰기 감소 (선택 유지) |
| `>` | Visual | 들여쓰기 증가 (선택 유지) |

### 파일 검색 (Telescope)

| 단축키 | 동작 | VS Code 대응 |
|--------|------|--------------|
| `Space ff` | 파일 이름으로 검색 | `Ctrl+P` |
| `Space fg` | 파일 내용 검색 (live grep) | `Ctrl+Shift+F` |
| `Space fb` | 열린 버퍼 목록 | - |
| `Space fr` | 최근 열었던 파일 | - |
| `Space fs` | LSP 심볼 검색 | `Ctrl+Shift+O` |
| `Space fh` | 도움말 태그 검색 | - |

### 파일 탐색기 (Neo-tree)

| 단축키 | 동작 | VS Code 대응 |
|--------|------|--------------|
| `Space e` | 탐색기 토글 | `Ctrl+B` |
| `Space o` | 탐색기로 포커스 | - |

### LSP

| 단축키 | 동작 | VS Code 대응 |
|--------|------|--------------|
| `gd` | 정의로 이동 | `F12` |
| `gr` | 참조 찾기 | `Shift+F12` |
| `gi` | 구현으로 이동 | `Ctrl+F12` |
| `K` | 호버 정보 | 마우스 hover |
| `Space rn` | 이름 변경 | `F2` |
| `Space ca` | 코드 액션 | `Ctrl+.` |
| `Space d` | 진단 정보 (float) | - |
| `[d` | 이전 진단으로 이동 | - |
| `]d` | 다음 진단으로 이동 | - |

### 자동완성 (nvim-cmp)

| 단축키 | 동작 |
|--------|------|
| `Ctrl+n` | 다음 항목 선택 |
| `Ctrl+p` | 이전 항목 선택 |
| `Ctrl+d` | 문서 아래로 스크롤 |
| `Ctrl+u` | 문서 위로 스크롤 |
| `Enter` | 선택 확정 |
| `Tab` | 다음 항목 / 스니펫 점프 |

## 기본 LSP 서버

Mason을 통해 자동 설치된다:

- `lua_ls` -- Lua
- `pyright` -- Python
- `ts_ls` -- TypeScript / JavaScript
- `yamlls` -- YAML

## 에디터 옵션 요약

- 탭: 2칸 스페이스
- 줄 번호: 절대 번호
- 줄 바꿈: 비활성
- 클립보드: 시스템 클립보드 공유
- 스왑 파일: 비활성 / undo 파일: 활성
- 검색: 대소문자 무시 + smartcase
- 80칸 컬럼 가이드라인
- 창 분할: 오른쪽/아래 방향

## Treesitter 지원 언어

Lua, Python, JavaScript, TypeScript, TSX, Go, Rust, Java, YAML, JSON, Markdown, Bash
