# 工作中办公效率提升神器汇总

> **在平常工作中，通常会有很多重复性的工作，而且使用比较频繁，因此本文下面主要进行介绍工作中常用的shell命令，用来提升工作效率**  

## 一、命令说明

1. **当前所有命令都是在mac环境下执行，如果linux或者windows，不敢确保命令100%能正常执行**
2. **所有命令都是遵循一个规则，首先编写完整的shell命令脚本，然后通过`ln -s xxx.sh xxx`的方式创建一个软连接，便于命令行使用**
3. **创建软链接的名称遵循缩写来命令，方便记忆**

## 二、如何使用

**1.克隆本项目到本地目录**

``` shell
git clone https://github.com/jaydenwen123/shell_tool.git
```

**2.将克隆后的本地目录加入到path环境变量中**

```shell
a. vim /etc/profile                  // vim 打开/etc/profile
b. export PATH=$PATH:"${currentDir}" //在/etc/profile中追加这菊花
c. source /etc/profile               //使得/etc/profile文件生效
```

**3.然后开心的玩耍**

```shell
例如：
1. ool github.com/jaydenwen123/shell_tool  //在浏览器中打开github.com/jaydenwen123/shell_tool
2. ool https://github.com/jaydenwen123/shell_tool  //在浏览器中打开github.com/jaydenwen123/shell_tool
3. ool //如果当前目录是个git工程并且绑定到了远程的分支，则会在浏览器端打开该工程
```


## 三、命令使用介绍


### 1.git 提交、推送远程命令gp
**该组命令主要用来完成通常的git add/commit/push等工作，通过命令来减少鼠标和界面操作**

	gp->git_push.sh
	git_push.sh
	
	gp :为通过ln创建的一个软连接
	gp的用法主要有以下三种:
	
	# 用法一、添加、提交本地工作区修改的内容
	1. gp "feat:update code logic"
	
	# 用法二、添加、提交、推送本地工作区修改的内容到远程仓库 gp后带提交
	2. gp "feat:update code logic" abc
	
	# 用法三、将本地仓库的提交推送到远程，gp后不带任何参数
	3. gp

#### 使用案例

**1.1 将当前工程中的所有更改添加通过指定的msg提交**

``` shell
//在gp后面跟提交信息msg即可

 ➜  ~/shell_tool git:(master) ✗ gp "feat:update git_push.sh"
[INFO] git status
On branch master
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

        modified:   README.md
        modified:   git_push.sh

no changes added to commit (use "git add" and/or "git commit -a")
[INFO] exec git add .
On branch master
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

        modified:   README.md
        modified:   git_push.sh

[INFO] exec git commit -m feat:update git_push.sh
[master b39a91c] feat:update git_push.sh
 2 files changed, 2 insertions(+), 2 deletions(-)
```

**1.2 将当前工作区的修改，通过指定的msg提交，并推动到远程仓库**

```shell
//在指定的提交消息后面打个空格，然后随便输入一些信息，则只会commit不会执行push

➜  ~/shell_tool git:(master) ✗ gp "feat:update init_git_project.sh" ""
[INFO] git status
On branch master
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

        modified:   README.md
        modified:   init_git_project.sh

no changes added to commit (use "git add" and/or "git commit -a")
[INFO] exec git add .
On branch master
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

        modified:   README.md
        modified:   init_git_project.sh

[INFO] exec git commit -m feat:update init_git_project.sh
[master c394e14] feat:update init_git_project.sh
 2 files changed, 21 insertions(+), 17 deletions(-)
[INFO] git push origin master
Enumerating objects: 12, done.
Counting objects: 100% (12/12), done.
Delta compression using up to 12 threads
Compressing objects: 100% (8/8), done.
Writing objects: 100% (8/8), 1.22 KiB | 1.22 MiB/s, done.
Total 8 (delta 6), reused 0 (delta 0)
remote: Resolving deltas: 100% (6/6), completed with 4 local objects.
To https://github.com/jaydenwen123/shell_tool.git
   edb6140..c394e14  master -> master
➜  ~/shell_tool git:(master) 
```

**1.3 将当前分支的所有提交推送到远程**

```shell
//不带任何参数,则将所有的提交推送到远程仓库
➜  ~/shell_tool git:(master) gp

[INFO] execute action:<git push origin master>
Enumerating objects: 5, done.
Counting objects: 100% (5/5), done.
Delta compression using up to 12 threads
Compressing objects: 100% (3/3), done.
Writing objects: 100% (3/3), 544 bytes | 544.00 KiB/s, done.
Total 3 (delta 2), reused 0 (delta 0)
remote: Resolving deltas: 100% (2/2), completed with 2 local objects.
To https:/	/github.com/jaydenwen123/shell_tool.git
   f7e454d..7626d45  master -> master
```


### 2.git 查看当前工作区状态命令gs

**该命令即可以查看当前工作区的内容变更状态，也可以获取当前git项目远程绑定的git url地址**

	git_status.sh
	gs->git_status.sh
	
	gs:为通过ln -s创建的软连接
	gs:git status,git show两种用途
	
	#用法一、gs后面不带任何参数，查看当前git项目变更状态即执行git status
	1.gs
	
	#用法二、gs 后面随便加任何参数，则查看当前git项目绑定的远程git仓库地址，例如https://github.com/jaydenwen123/shell_tools.git
	
	2.gs xxx
	
	
**2.1 查看当前git项目变更状态**

```shell
➜  ~/shell_tool git:(master) gs
On branch master
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

        modified:   README.md

no changes added to commit (use "git add" and/or "git commit -a")
➜  ~/shell_tool git:(master) ✗ 



```

**2.2 查看当前git项目绑定的远程git仓库地址**

> **温馨提示：查看后当前项目远程仓库地址已经复制到粘贴板，可以直接在任何地方黏贴**
	
```shell
➜  ~/shell_tool git:(master) ✗ gs xxx
[INFO] the project url:
https://github.com/jaydenwen123/shell_tool.git
[INFO] the project url is copyed in your pasteboard
➜  ~/shell_tool git:(master) ✗ 

```
	
### 3.git 初始化本地目录为仓库命令igp

> 在工作中经常会去逛github，然后发现很容易在公司项目和个人github项目提交时搞混提交的username和email，特此通过一个脚本来帮助自己初始化git项目
> 
> 特此奉上一个如果用错了提交的用户名和email时，批量修改以前提交记录的shell命令工具

```shell
 git filter-branch --commit-filter '
        if [ "$GIT_AUTHOR_EMAIL" = "person_email@qq.com" ];
        then
                GIT_AUTHOR_NAME="company_username";
                GIT_AUTHOR_EMAIL="email@company.com";
                git commit-tree "$@";
        else
                git commit-tree "$@";
        fi' HEAD 
```

**该组命令主要用来初始化本地目录为git仓库,igp缩写为init git project** 

	igp->init_git_project.sh
	init_git_project.sh
	
	#该命令有两种用法
	# 用法一、直接执行igp时，后面跟目录名，当前目录则用. 表示。初始化git项目，并配置当前的git项目的用户名和邮箱为个人的信息
	
	1. igp  //平常应该github用的多些，因此默认初始化项目并配置时采用个人账号信息配置git项目，每个人可以根据自身情况酌情更改
	
	# 用法二、igp命令后面跟任何参数时，则初始化git项目，此时配置当前的git项目的用户名和邮箱为公司信息
	
	2. igp .  xxx 

**需要注意，个人邮箱、用户名、公司邮箱、公司用户名都配置在环境变量中，每个人可以自行配置**
**3.1用个人用户名和邮箱信息配置当前的git项目**

```shell
# 初始化当前目录，用个人信息
➜  ~/shell_tool git:(master) ✗ igp
Reinitialized existing Git repository in /Users/user/shell_tool/.git/
[INFO] init project with personal info.
[INFO] git config username with username
[INFO] git config email with xxxxx@qq.com
➜  ~/shell_tool git:(master) ✗ 



# 初始化新目录
➜  ~/shell_tool git:(master) ✗ mkdir xxx
➜  ~/shell_tool git:(master) ✗ igp xxx 
Initialized empty Git repository in /Users/xxx/shell_tool/xxx/.git/
[INFO] init project with personal info.
[INFO] git config username with xxx
[INFO] git config email with 2282186474@qq.com
➜  ~/shell_tool git:(master) ✗ 
```

**3.2用公司提供给个人的用户名和邮箱信息配置当前的git项目**
	
```shell
➜  ~/shell_tool git:(master) ✗ igp . xx
Reinitialized existing Git repository in /Users/xxxx/shell_tool/.git/
[INFO] init project with company info.
[INFO] git config username with xxxxx
[INFO] git config email with xxxxx@tencent.com
➜  ~/shell_tool git:(master) ✗ 


# 初始化xxx目录用公司信息
➜  ~/shell_tool git:(master) ✗ igp xxx ..
Reinitialized existing Git repository in /Users/xxx/shell_tool/xxx/.git/
[INFO] init project with company info.
[INFO] git config username with xxx
[INFO] git config email with xxx@tencent.com
➜  ~/shell_tool git:(master) ✗ 

```
	
### 4.创建git工程命令

**通过命令行远程创建工程**

	cgp->create_git_project.sh
	create_git_project.sh
	
	
	

### 5.打开git 仓库命令oo
**在当前git目录执行oo，即可一键在浏览器端打开该仓库，然后查看内容**

	oo->open_git_project.sh
	open_git_project.sh
	

**5.1一键打开仓库命令示例**

```shell
# 执行oo，然后再浏览器端打开当前git远程仓库
➜  ~/shell_tool git:(master) ✗ oo
[INFO] the project url:https://github.com/jaydenwen123/shell_tool.git
[INFO] the project protocol:http
➜  ~/shell_tool git:(master) ✗ 

```
	
### 6.打开git 个人主页、组织首页命令og

**通过该命令打开当前项目的作者github个人主页或者组织首页，避免每次都需要在浏览器地址栏输入项目仓库地址**

	og->open_git_group.sh
	open_git_group.sh

**6.1 一键打开远程仓库示例**

``` shell
直接在当前git目录执行og，即可在浏览器端打开主页
➜  ~/shell_tool git:(master) ✗ og
[INFO] the project url:https://github.com/jaydenwen123/shell_tool.git
[INFO] the project protocol:http
[INFO] the group url:https://github.com/jaydenwen123
➜  ~/shell_tool git:(master) ✗

```

### 7.便捷登录个人云服务器命令mm
**在开发过程中，通常都会遇到本地编写项目，然后再在远程服务器执行编译环境，每次编译都需要登录到远程的个人云服务器，因此特地搞了一个小脚本，然后再本地目录执行mm一键切换至远程服务器的当前目录，然后执行响应的编译即可，最后执行exit退出后，又可回到当前的本地目录，一键爽歪歪（哈哈哈）**  

	mm->ssh_cloud_server.sh
	ssh_cloud_server.sh

**7.1 一键切换示例**	

``` shell
➜  ~/GoWorkspace/src/workDir git:(master) mm
[INFO] pwd:/Users/xxx/GoWorkspace/src/workDir
[INFO] dest dir:/data/home/kd-weibo-flow/weibo_tools
[xxx@xxxx /data/home/GoWorkspace/src/workDir]# ./build.sh //执行build.sh进行编译

```
	
	
### 8.打开git开源项目命令ool

**一键打开远程git仓库地址，该命令主要有几大用途：  
1.当前目录是git目录，则执行ool和执行oo效果一样，在浏览器打开远程仓库  
2.在go mod模式下，进入$GOPATH/pkg/mod/github.com/xxuser/xxxproj@v0.1.1目录，然后执行时，也会在浏览器端打开该仓库  
3.在ool后面跟golang语言的go文件中引用的第三方包时，也可以直接打开指定的仓库，方便查看源码**


	ool->open_other_library.sh
	open_other_library.sh
	
	# 用法一、当前目录是git目录执行，并且不带任何参数，则在浏览器打开该项目
	1.ool
	
	# 用法二、当前目录是go mod模式下，进入$GOPATH/pkg/mod/github.com/xxuser/xxxproj@v0.1.1目录，执行ool，打开该远程仓库
	2.ool
	
	# 用法三、在任意目录下执行ool并执行github远程的仓库地址，则在浏览器端打开指定的仓库
	3.1 ool github.com/golang/protobuf
	3.2 ool http://github.com/golang/protobuf
	3.3 ool "github.com/golang/protobuf"
	
**8.1 当前目录是git目录执行，并且不带任何参数，则在浏览器打开该项目**

```shell
➜  ~/shell_tool git:(master) ✗ ool
[INFO] the project url:https://github.com/jaydenwen123/shell_tool.git
[INFO] the project protocol:http
➜  ~/shell_tool git:(master) ✗ 

```


**8.2 当前目录是go mod模式下，进入$GOPATH/pkg/mod/github.com/xxuser/xxxproj@v0.1.1目录**


```shell
➜  ~/GoWorkspace/src/pkg/mod/github.com/go-playground/form@v3.1.4+incompatible git:(master) ✗ ool
[INFO]:the currentDir is:/Users/wenxiaofei/GoWorkspace/src/pkg/mod/github.com/go-playground/form@v3.1.4+incompatible
[INFO]:library repo url:
https://github.com/go-playground/form.git
[INFO]:open the reporistory url [in your brower]
➜  ~/GoWorkspace/src/pkg/mod/github.com/go-playground/form@v3.1.4+incompatible git:(master) ✗ 


```

**8.3 在任意目录下执行ool并执行github远程的仓库地址，则在浏览器端打开指定的仓库**
	
	
```shell

➜  ~/shell_tool git:(master) ✗ git:(master) ✗ ool github.com/golang/protobuf/proto
[INFO] open the project url:http://github.com/golang/protobuf/proto
➜  ~/shell_tool git:(master) ✗ git:(master) ✗ ool github.com/golang/protobuf
[INFO] open the project url:http://github.com/golang/protobuf
➜  ~/shell_tool git:(master) ✗ git:(master) ✗ ool http://github.com/golang/protobuf
[INFO] open the project url:http://github.com/golang/protobuf
➜  ~/shell_tool git:(master) ✗ git:(master) ✗ 

```
	

### 9.便捷打开协议管理平台平台命令oor

**本地执行oor在浏览器打开协议地址，快速查看和更新协议**

	oor->open_rick.sh
	open_rick.sh

