# 中一級石器時代遊戲

第一階段：草地探索。以 Godot 4.7.2 製作，支援手機、平板及電腦瀏覽器。

## 操作

- 手機：左半畫面拖動行走，右半畫面拖動觀看；可同時操作，建議橫向。
- 電腦：按一下遊戲畫面，WASD／方向鍵行走，滑鼠觀看，Esc 釋放滑鼠。

目前只有草地、第一身角色、碰撞與操作。實體手機的手感與效能仍待試玩確認。

## GitHub Pages

網站檔案在 `docs/`。在儲存庫 Settings → Pages 選擇 Deploy from a branch、main 分支及 /docs，儲存後等待部署完成。

預定網址：https://kitlung1107.github.io/-/

更新遊戲後，用 Godot 4.7.2 的 Web 預設匯出 Release 至 `docs/index.html`，再提交及推送。Web 使用 Compatibility／WebGL 2 和單執行緒。

## 開發

主場景：`scenes/main.tscn`。Godot 按 F5 執行。自動測試：`godot --headless --path . --script res://tests/smoke.gd`。

官方 Web 模板可由 `tests/fetch_web_templates.py` 下載至 `tools/web_templates/`，該目錄不提交。網頁發佈檔不含本機測試憑證、私鑰及本機網絡設定。

中文字型：Noto Sans TC，SIL Open Font License，見 `assets/fonts/OFL.txt`。
