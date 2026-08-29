#!/bin/zsh
set -euo pipefail

DEST="${1:-}"
[[ -n "$DEST" ]] || { print -u2 "用法: $0 <新机框架根目录>"; exit 2; }
DEST="${DEST:A}"

mkdir -p "$DEST/00-中立协议与总入口"
mkdir -p "$DEST/01-AI工具本体模板/必要"/{00-工具身份与启动入口,01-全局门禁与用户习惯,02-项目登记与路由,03-配置技能与连接能力,04-恢复与验收,99-通用模板}
mkdir -p "$DEST/01-AI工具本体模板/非必要"/{全局候选池,未归属对话,历史配置,失败与审计记录}
mkdir -p "$DEST/02-项目登记"
mkdir -p "$DEST/03-项目模板/本地工作台/必要"/{00-项目控制台,01-主线与任务入口,02-需求规划台,03-治理规则台,04-恢复与交接,99-入口与模板}
mkdir -p "$DEST/03-项目模板/本地工作台/非必要/对话与交接"/{active,completed,snapshots,patches}
mkdir -p "$DEST/03-项目模板/本地工作台/非必要"/{原始输入与暂存,运行报告,历史归档,待分类材料}
mkdir -p "$DEST/03-项目模板/Obsidian知识库/必要"/{00-项目总览与规范,01-需求规划台,02-项目主线,03-治理规则台,04-资料与证据,05-架构数据与方法,06-任务分支与审核,07-交付与版本记录,08-项目正式记忆,09-项目记忆候选池,90-AI适配区,99-模板与索引}
mkdir -p "$DEST/03-项目模板/Obsidian知识库/必要/90-AI适配区"/{AI-1,AI-2,AI-3}
mkdir -p "$DEST/03-项目模板/Obsidian知识库/非必要"/{原始材料,转换稿与错误日志,背景与扩展资料,对话历史,淘汰重复与历史归档}
mkdir -p "$DEST/04-跨AI交接模板" "$DEST/05-恢复与审计"

cat > "$DEST/00-中立协议与总入口/总入口.md" <<'EOF'
# 多 AI 项目框架总入口

1. 每个 AI 只读取自己的本体层。
2. 每个项目同时拥有本地工作台和项目 Obsidian。
3. 项目公共事实写入 Obsidian 公共区。
4. 某 AI 的项目理解只写入自己的适配区。
5. AI 切换依靠共享交接 MD，不依靠读取原 AI 的内部目录。
6. 任何冲突、路径不明或权限不明都标记 blocked。
EOF

cat > "$DEST/02-项目登记/项目登记表.yaml" <<'EOF'
version: 1
projects: []
note: 每个项目必须绑定 project_id、本地工作台和项目 Obsidian；Git 可选。
EOF

cat > "$DEST/03-项目模板/本地工作台/必要/00-项目控制台/项目身份卡.md" <<'EOF'
# 项目身份卡

- project_id: <唯一ID>
- project_name: <项目名称>
- workspace_root: <本地工作台绝对路径>
- obsidian_vault: <项目Obsidian绝对路径>
- git: none|<路径>
- status: registered|partial|blocked|verified
EOF

cat > "$DEST/03-项目模板/Obsidian知识库/主页.md" <<'EOF'
# 项目知识库主页

- 项目总览：`必要/00-项目总览与规范`
- 需求规划台：`必要/01-需求规划台`
- 项目主线：`必要/02-项目主线`
- 治理规则台：`必要/03-治理规则台`
- 项目正式记忆：`必要/08-项目正式记忆`
- 项目记忆候选池：`必要/09-项目记忆候选池`
- AI 适配区：`必要/90-AI适配区`
EOF

cat > "$DEST/03-项目模板/Obsidian知识库/必要/90-AI适配区/README.md" <<'EOF'
# AI 适配区权限

每个 AI 只维护自己的子目录。其他 AI 默认只读；修改、移动、删除或覆盖必须获得用户二次授权。项目公共事实不得只保存在某一个 AI 适配区。
EOF

cat > "$DEST/04-跨AI交接模板/断网前续作.md" <<'EOF'
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
EOF

cat > "$DEST/05-恢复与审计/本次恢复记录.md" <<EOF
# 纯框架联动恢复记录

- 时间：$(date -Iseconds)
- 目标目录：$DEST
- 模式：framework-only
- 已创建：AI 本体模板、本地工作台模板、项目 Obsidian 模板、AI 适配区、项目登记和跨 AI 交接模板
- 未恢复：旧项目、旧数据、旧对话、旧配置和敏感值
- 下一步：复制 AI 本体模板和项目模板，登记第一个新项目
EOF

print "framework-created: $DEST"
print "mode: framework-only-linked"
print "old-project-data: not restored"
