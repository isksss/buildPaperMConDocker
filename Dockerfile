# papermcを起動するためのDockerfile java:17
FROM openjdk:17
# 作業ディレクトリを作成

WORKDIR /papermc
# papermcをダウンロード
RUN sudo apt update && sudo apt install curl jq -y && \
    curl https://raw.githubusercontent.com/isksss/downloadPaperMC/master/download.sh | bash

# ポートを開ける
EXPOSE 25565
EXPOSE 19132

# 起動スクリプトをコピー
COPY start.sh /papermc/start.sh

# start.shを実行可能にする
RUN chmod +x /papermc/start.sh

# eulaを同意
RUN echo "eula=true" > eula.txt

# papermcを起動
CMD ["./start.sh"]