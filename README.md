# ZhiXiongYouDaoNoteInstallationPackage
一个仿有道云笔记的安装包，使用Inno Setup制作

## 安装界面效果图
![Image load failure](https://github.com/GanZhiXiong/ZhiXiongYouDaoNoteInstallationPackage/blob/master/images/0.png)

![Image load failure](https://github.com/GanZhiXiong/ZhiXiongYouDaoNoteInstallationPackage/blob/master/images/1.png)

![Image load failure](https://github.com/GanZhiXiong/ZhiXiongYouDaoNoteInstallationPackage/blob/master/images/2.png)

![Image load failure](https://github.com/GanZhiXiong/ZhiXiongYouDaoNoteInstallationPackage/blob/master/images/3.png)

## Inno Setup是什么?
Inno Setup用Delphi写成，其官方网站同时也提供源程序免费下载。它虽不能与Installshield这类恐龙级的安装制作软件相比，但也当之无愧算是后起之秀。Inno Setup是一个免费的安装制作软件，小巧、简便、精美是其最大特点，支持pascal脚本，能快速制作出标准Windows2000风格的安装界面，足以完成一般安装任务。

`Inno Setup安装程序（InnoSetup_51(A&U).7z）我已放置在此仓库中`

`想测试该脚本请先安装Inno Setup`

## 该脚本实现了那些功能？

* 仿有道云笔记安装包界面
* 安装完成后运行指定程序
* 自动检测是否安装.net 环境，没有安装先静默安装
* 安装或卸载前检测指定程序是否运行，引导用户先关闭后才能继续安装或卸载


## 有问题反馈
在使用中有任何问题，欢迎反馈给我。

## 捐助开发者
有钱捧个钱场，没钱捧个人场，谢谢各位。

![](https://github.com/GanZhiXiong/ZhiXiongYouDaoNoteInstallationPackage/blob/master/images/Pay/AlipayQRCode.jpg)
![](https://github.com/GanZhiXiong/ZhiXiongYouDaoNoteInstallationPackage/blob/master/images/Pay/weixinpay_qrcode.jpg)

## 感激
感谢CSDN coder：harouncloud 提供的DEMO  

harouncloud的博客：http://my.csdn.net/harouncloud

该脚本是在harouncloud提供的有道云笔记的基础上编写的

解决了harouncloud遗留的bug

## 关于作者

```javascript
  var coder = {
    nickName  : "干志雄",
    site : "http://xinweijs.com"
    qq : "1551935335"
    email : "ganzhixiong@sina.cn"
  }
```