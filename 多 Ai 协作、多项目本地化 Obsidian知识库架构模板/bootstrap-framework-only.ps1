param(
  [Parameter(Mandatory=$true)][string]$Destination
)
$ErrorActionPreference = "Stop"
$root = [System.IO.Path]::GetFullPath($Destination)
$dirs = @(
  "00-中立协议与总入口",
  "01-AI工具本体模板/必要/00-工具身份与启动入口",
  "01-AI工具本体模板/必要/01-全局门禁与用户习惯",
  "01-AI工具本体模板/必要/02-项目登记与路由",
  "01-AI工具本体模板/必要/03-配置技能与连接能力",
  "01-AI工具本体模板/必要/04-恢复与验收",
  "01-AI工具本体模板/必要/99-通用模板",
  "01-AI工具本体模板/非必要/全局候选池",
  "01-AI工具本体模板/非必要/未归属对话",
  "01-AI工具本体模板/非必要/历史配置",
  "01-AI工具本体模板/非必要/失败与审计记录",
  "02-项目登记",
  "03-项目模板/本地工作台/必要/00-项目控制台",
  "03-项目模板/本地工作台/必要/01-主线与任务入口",
  "03-项目模板/本地工作台/必要/02-需求规划台",
  "03-项目模板/本地工作台/必要/03-治理规则台",
  "03-项目模板/本地工作台/必要/04-恢复与交接",
  "03-项目模板/本地工作台/必要/99-入口与模板",
  "03-项目模板/本地工作台/非必要/对话与交接/active",
  "03-项目模板/本地工作台/非必要/对话与交接/completed",
  "03-项目模板/本地工作台/非必要/对话与交接/snapshots",
  "03-项目模板/本地工作台/非必要/对话与交接/patches",
  "03-项目模板/本地工作台/非必要/原始输入与暂存",
  "03-项目模板/本地工作台/非必要/运行报告",
  "03-项目模板/本地工作台/非必要/历史归档",
  "03-项目模板/本地工作台/非必要/待分类材料",
  "03-项目模板/Obsidian知识库/必要/00-项目总览与规范",
  "03-项目模板/Obsidian知识库/必要/01-需求规划台",
  "03-项目模板/Obsidian知识库/必要/02-项目主线",
  "03-项目模板/Obsidian知识库/必要/03-治理规则台",
  "03-项目模板/Obsidian知识库/必要/04-资料与证据",
  "03-项目模板/Obsidian知识库/必要/05-架构数据与方法",
  "03-项目模板/Obsidian知识库/必要/06-任务分支与审核",
  "03-项目模板/Obsidian知识库/必要/07-交付与版本记录",
  "03-项目模板/Obsidian知识库/必要/08-项目正式记忆",
  "03-项目模板/Obsidian知识库/必要/09-项目记忆候选池",
  "03-项目模板/Obsidian知识库/必要/90-AI适配区/AI-1",
  "03-项目模板/Obsidian知识库/必要/90-AI适配区/AI-2",
  "03-项目模板/Obsidian知识库/必要/90-AI适配区/AI-3",
  "03-项目模板/Obsidian知识库/必要/99-模板与索引",
  "03-项目模板/Obsidian知识库/非必要/原始材料",
  "03-项目模板/Obsidian知识库/非必要/转换稿与错误日志",
  "03-项目模板/Obsidian知识库/非必要/背景与扩展资料",
  "03-项目模板/Obsidian知识库/非必要/对话历史",
  "03-项目模板/Obsidian知识库/非必要/淘汰重复与历史归档",
  "04-跨AI交接模板",
  "05-恢复与审计"
)
foreach ($dir in $dirs) { New-Item -ItemType Directory -Path (Join-Path $root $dir) -Force | Out-Null }
@"
# 多 AI 项目框架总入口

每个 AI 本体独立；项目通过本地工作台、项目 Obsidian 和标准交接 MD 实现接续。禁止修改其他 AI 的本体和适配区。
"@ | Set-Content -Encoding UTF8 (Join-Path $root "00-中立协议与总入口/总入口.md")
@"
version: 1
projects: []
"@ | Set-Content -Encoding UTF8 (Join-Path $root "02-项目登记/项目登记表.yaml")
@"
# 项目知识库主页

- 项目总览：必要/00-项目总览与规范
- 需求规划台：必要/01-需求规划台
- 项目主线：必要/02-项目主线
- 治理规则台：必要/03-治理规则台
- 项目正式记忆：必要/08-项目正式记忆
- 项目记忆候选池：必要/09-项目记忆候选池
- AI 适配区：必要/90-AI适配区
"@ | Set-Content -Encoding UTF8 (Join-Path $root "03-项目模板/Obsidian知识库/主页.md")
@"
# 断网前续作

- project_id:
- task_id:
- source_ai:
- status:
- 已完成：
- 未完成：
- 修改文件与版本：
- 禁止操作：
- 回退位置：
- 唯一下一步：
"@ | Set-Content -Encoding UTF8 (Join-Path $root "04-跨AI交接模板/断网前续作.md")
Write-Output "framework-created: $root"
Write-Output "mode: framework-only-linked"
Write-Output "old-project-data: not restored"
