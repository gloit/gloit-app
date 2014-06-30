## Gloit App

### 准备工作

如果是在`Windows 7`以上使用此应用，请先安装[node.js](http://nodejs.org)，并把安装目录设置到`PATH`中。
然后安装`ember-cli`和`Bower`

```cmd
> npm install -g ember-cli
> npm install -g bower
```

最后把`node`的全局库目录`C:\Users\username\AppData\Roaming\npm`加入`PATH`中。

### 开始

签出项目到本地：

```cmd
> git clone https://github.com/gloit/gloit-app
```

安装依赖：

```cmd
> npm install
> bower install
```

启动应用：

```cmd
> ember server
```

打开浏览器，访问 http://localhost:4200
便可打开应用。默认用户名为：admin，密码为：123456。