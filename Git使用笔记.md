# Git 使用笔记

#### 添加、生成SSH Key

```
ssh-keygen -t rsa -C "my_email@163.com"
pbcopy < ~/.ssh/id_rsa.pub
// 添加到Git
```

#### 给已有仓库添加 remote
```
git remote new_remote ssh ssh://git@git.dtfindme.cn:7999/mgm_i/mgmshop.git

git push --all new_remote
git push --tags new_remote
```

#### 给已有仓库更换 remote

```
git remote rm origin
git remote set-url origin http://git.dtfindme.cn/scm/mgm_i/movieprivaterepo.git 
```
#### 删除、弃用依赖时项目操作

```
mgmpay 编译出现问题按一下步骤操作
1. `pod cache clean MGUnionPayManager`命令执行后出现的全部删除
2. 删除工程下的 Pods/ 
3. pod update
```

#### 发版步骤
1. 在`xxx.podspec`设置 `s.version` 改变版本号。
2. `git add . && git commit -m 'commit message'`
3. `git push origin master`
4. `git tag -a 0.02 -m 'message'`
5. 本地`lint`
    ```
    pod lib lint --sources=http://dtfindme.com:8089/ios-movie/moviePrivateRepo.git,https://github.com/CocoaPods/Specs.git --use-libraries --allow-warnings --verbose  --no-clean --skip-import-validation
    ```
6. 本地 `lint` 成功后，推送标签 `git push origin master --tags`
7. 推送标签后，进行远程 `lint` ：

    ```
    pod spec lint --allow-warnings --sources=http://dtfindme.com:8089/ios-movie/moviePrivateRepo.git,https://github.com/CocoaPods/Specs.git --use-libraries --no-clean --skip-import-validation
    ```
8. 推送项目相应版本的`.podspec文件到私`有库 

    ```
    pod repo push 162-ios-movie-movieprivaterepo xxx.podspec  --allow-warnings --sources=http://dtfindme.com:8089/ios-movie/moviePrivateRepo.git,https://github.com/CocoaPods/Specs.git --use-libraries
    ```