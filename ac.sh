cppVersion="c++17"  # 指定 C++ 版本
runTime="3s"        # 限定程序运行时间
keepLine="100"      # 保留输出数据长度

echo -n '⏳' > 'qwq/out' && \
g++ -g -std="$cppVersion" ac.cpp -o qwq/ac && \
cat 'qwq/in' | \
timeout "$runTime" sh -c "'qwq/ac' > 'qwq/out.raw'"

if [ $? -ne 0 ]; then
    echo -e "\033[0;31m TLE [ac1] "$runTime" \033[0m"
fi  # 检查 timeout 命令的退出状态

head -n "$keepLine" 'qwq/out.raw' > 'qwq/out'

# 第二个程序

echo -n '⏳' > 'qwq/out2' && \
g++ -g -std="$cppVersion" ac2.cpp -o qwq/ac2 && \
cat 'qwq/in' | \
timeout "$runTime" sh -c "'qwq/ac2' > 'qwq/out2.raw'"

if [ $? -ne 0 ]; then
    echo -e "\033[0;31m TLE [ac2] "$runTime" \033[0m"
fi  # 检查 timeout 命令的退出状态

head -n "$keepLine" 'qwq/out2.raw' > 'qwq/out2'