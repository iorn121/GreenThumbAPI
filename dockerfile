# Docker OfficialのRustイメージを使用
FROM rust:1.60.0

# /todoディレクトリでビルド
WORKDIR /todo

# 必要ファイルをコピー
COPY Cargo.toml Cargo.toml

RUN mkdir src
RUN echo "fn main(){}" > src/main.rs

# release プロファイルでコンパイル
RUN cargo build --release

COPY ./src ./src
COPY ./templates ./templates

RUN rm -f target/release/deps/todo*

# .cargo/bin/ にインストール
RUN cargo install --path .

CMD ["todo"]