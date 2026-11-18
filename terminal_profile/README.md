# Terminal.app BasicLight 프로필 가이드

> 목적: 화면 설정이 자동일 때 낮/밤에 따라 색이 바뀌는 **Basic** 프로필 대신, **항상 라이트 색으로 고정**된 **BasicLight** 프로필을 사용합니다.  
> 프로필 파일: `BasicLight.terminal` (이 가이드와 같은 폴더)

## 배경

- Basic 프로필은 설정에 배경색/글자색이 저장돼 있지 않고 macOS 시스템 기본(동적) 색을 따릅니다.
- 그래서 자동 모드에서 낮/밤에 따라 색이 바뀌며, 이를 끄는 별도 설정은 없습니다.
- BasicLight는 Basic의 간격 등 설정을 복사하고 **색을 라이트 값으로 고정**한 프로필입니다. 폰트는 Basic의 기본(SF Mono Terminal 12) 대신 **Monaco 12**로 지정했습니다.

## 프로필 내용

| 항목 | 값 |
|---|---|
| 이름 | `BasicLight` |
| 배경 | `#FFFFFF` |
| 글자 / 굵은 글자 | `#000000` |
| 커서 | `#929292` |
| 선택 영역 | `#B3D7FF` |
| ANSI 16색 | Basic 라이트 값 |
| 폰트 | `Monaco` / `12pt` |
| 간격·옵션 | 기존 Basic 설정 그대로 |

ANSI 16색 (일반 / 밝은 색):

| 색 | 일반 | 밝은 색 |
|---|---|---|
| Black | `#000000` | `#818383` |
| Red | `#C23621` | `#FC391F` |
| Green | `#25BC24` | `#31E722` |
| Yellow | `#ADAD27` | `#EAEC23` |
| Blue | `#492EE1` | `#5833FF` |
| Magenta | `#D338D3` | `#F935F8` |
| Cyan | `#33BBC8` | `#14F0F0` |
| White | `#CBCCCD` | `#E9EBEB` |

> 색 값은 Basic 프로필에서 읽어 온 것이 아니라 Basic 라이트의 알려진 값으로 채웠습니다. 선택 색·커서 색은 원본과 조금 다를 수 있습니다.

## 설치 방법

### 방법 1. 더블클릭

`BasicLight.terminal`을 더블클릭하면 Terminal에 프로필이 등록되고 창이 하나 열립니다. 열린 창은 닫아도 됩니다.

### 방법 2. 스크립트

`BasicLight.terminal`과 같은 폴더에 `install-basiclight.sh`로 저장한 뒤 실행합니다.

```bash
#!/bin/zsh
# terminal_profile/install-basiclight.sh
# BasicLight 프로필을 Terminal.app 에 등록하고 기본 프로필로 지정

PROFILE="${0:A:h}/BasicLight.terminal"

if [[ ! -f "$PROFILE" ]]; then
  echo "❌ BasicLight.terminal 을 찾을 수 없습니다: $PROFILE"
  exit 1
fi

# 프로필 가져오기 (더블클릭과 동일)
open "$PROFILE"
sleep 2

# 기본 프로필 + 새 창/탭 시작 프로필로 지정
osascript <<'EOF'
tell application "Terminal"
  set default settings to settings set "BasicLight"
  set startup settings to settings set "BasicLight"
end tell
EOF

echo "✅ BasicLight 프로필 등록 및 기본값 지정 완료"
echo "새 창을 열어 확인하세요. (가져오며 열린 창은 닫아도 됩니다)"
```

```bash
chmod +x terminal_profile/install-basiclight.sh
terminal_profile/install-basiclight.sh
```

## 수동으로 기본 프로필 지정

Terminal → 설정(⌘,) → 프로필 → **BasicLight** 선택 → 하단 **기본값**을 클릭합니다.

## 확인

```bash
# 프로필 등록 여부
defaults read com.apple.Terminal "Window Settings" | grep BasicLight

# 현재 기본 프로필
defaults read com.apple.Terminal "Default Window Settings"
```

## 되돌리기

Terminal → 설정 → 프로필에서 BasicLight를 선택하고 하단 `−` 버튼으로 삭제합니다. 기본 프로필은 원하는 프로필(예: Basic)로 다시 지정합니다.

## 배경색 바꾸기

흰색 대신 따뜻한 오프화이트를 원하면 설정 → 프로필 → BasicLight → 텍스트 → 배경에서 값을 바꿉니다.

| 이름 | 배경 |
|---|---|
| 웜 화이트 | `#FAF8F3` |
| 크림 | `#FBF7EC` |
| 아이보리 | `#F7F1E1` |
| 세피아 | `#F4ECD8` |

배경을 누런 쪽으로 바꾸면 글자색은 `#2B2823` 정도의 따뜻한 짙은 색을 권장합니다.
