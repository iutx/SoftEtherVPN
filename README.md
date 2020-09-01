## SoftEtherVPN

### Docker

##### SoftetherVPN Server 去除拆分隧道功能限制版本，用于 `apline` 基础镜像构建

- softether-src-v4.30-9700-beta-viper.tar.gz 对应 Dockerfile.build

- softether-bin-v4.30-9700-beta-viper.tar.gz 对应 Dockerfile

##### 拉取命令

```shell
docker pull abyssviper/softethervpn:v4.30-9700-beta
```

##### 详细使用

具体详细使用请[参考镜像仓库文档](https://hub.docker.com/r/abyssviper/softethervpn)

### Kubernetes

##### 快速开始

```shell
kubectl apply -f deployment-quickstart.yaml
```

使用 [`siomiz/softethervpn`](https://hub.docker.com/r/siomiz/softethervpn) 镜像，默认分配账号以及连接信息通过 `logs`查看

具体详细额外参数请[参考文档](https://hub.docker.com/r/siomiz/softethervpn)

##### 完整发布

使用 [`abyssviper/softethervpn`](https://hub.docker.com/r/abyssviper/softethervpn) 镜像

仓库中的发布配置文件以 `NFS` 作为配置文件 `vpn_server.config` 的持久化存储

```shell
kubectl apply -f pv-softethervpn.yaml
kubectl apply -f deployment-softethervpn.yaml
```

具体详细使用请[参考博客](https://www.viper.pub/softether-vpn-k8s/)，一定要注意 [deployment 的命名陷阱](https://www.viper.pub/softether-vpn-k8s/#%E7%96%91%E9%97%AE%E7%82%B9)，该 Bug 暂时没有找到原因

