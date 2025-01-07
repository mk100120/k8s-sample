# 使用 OpenJDK 作为基础镜像
FROM mcr.microsoft.com/openjdk/jdk:17-ubuntu

# 将构建的 JAR 文件复制到容器中
COPY build/libs/k8s-sample-0.0.1-SNAPSHOT.jar app.jar


# 这里设置初始堆内存为 512 MB，最大堆内存为 2 GB
#ENV JAVA_TOOL_OPTIONS="-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5005"
#ENV JAVA_OPTS="-Xms512m -Xmx1g"

# 容器启动时运行 Spring Boot JAR 文件
#ENTRYPOINT ["java", "$JAVA_TOOL_OPTIONS","-jar", "app.jar"]

# 设置 JVM 参数：-Xms 初始堆内存，-Xmx 最大堆内存
ENTRYPOINT ["java", "-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=*:5005", "-jar", "app.jar"]

# 暴露容器端口
EXPOSE 8080
EXPOSE 5005