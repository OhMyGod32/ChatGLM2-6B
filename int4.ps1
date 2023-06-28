# 文件路径列表
$filePaths = @("api.py", "cli_demo.py", "openai_api.py", "web_demo.py", "web_demo2.py")

# 要查找和替换的文本
$oldText = ".\\THUDM\\chatglm2-6b"
$newText = ".\\THUDM\\chatglm2-6b-int4"

# 循环处理每个文件
foreach ($filePath in $filePaths) {
    # 检查文件是否存在
    if (Test-Path $filePath -PathType Leaf) {
        # 读取文件内容（指定编码为 UTF-8）
        $content = Get-Content -Path $filePath -Raw -Encoding UTF8

        # 查找和替换文本
        $newContent = $content -replace [regex]::Escape($oldText), $newText

        # 将修改后的内容写回文件（指定编码为 UTF-8）
        $newContent | Set-Content -Path $filePath -Encoding UTF8
        Write-Host "文件 $filePath 已成功修改。"
    } else {
        Write-Host "文件 $filePath 不存在。"
    }
}