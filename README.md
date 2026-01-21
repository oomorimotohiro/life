# life
大森基裕の人生

## 📁 フォルダ構成 (Folder Structure)

```
life/
├── Daily/        # 日々の記録 (Daily logs)
├── goal/         # 目標管理 (Goals)
├── thoughts/     # 思考・気づき (Thoughts)
├── ideas/        # アイデア (Ideas)
├── todo/         # やることリスト (Todo list)
```

## 🚀 クイック入力 (Quick Input)

最小限の入力で記録を残すためのスクリプトを用意しています。

### デイリーログを追加 (Add Daily Log)

```bash
# 簡単な入力
./quick-daily.sh "今日やったこと"

# エディタで詳細入力
./quick-daily.sh
```

### 目標を追加 (Add Goal)

```bash
# タイトルのみ
./quick-goal.sh "プログラミングを学ぶ"

# タイトルと説明
./quick-goal.sh "プログラミングを学ぶ" "Pythonから始める"
```

### メモ・思考を追加 (Add Note/Thought)

```bash
./quick-note.sh "いいアイデアを思いついた！"
```

## 💡 使い方のコツ (Usage Tips)

1. **デイリーログ**: 毎日の終わりに1行でもいいので記録を残す
2. **目標**: 小さな目標でも記録して、進捗を追跡
3. **思考メモ**: 思いついたことをすぐに記録

## 📝 ファイル形式 (File Format)

すべてMarkdown形式(.md)で保存されます。GitHubで読みやすく、検索も簡単です。
