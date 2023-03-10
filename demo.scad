// 参考サイト
// 動画: https://dotinstall.com/lessons/basic_openscad 
// 文字: https://ja.wikibooks.org/wiki/OpenSCAD_User_Manual

////■■■■■■■■■■■■■■コメント，インデント■■■■■■■■■■■■■■
// ←これがコメントアウト（コマンドの無効化）
// コメントアウトは[Ctrl]+[D]
// コメントアウト解除は[Ctrl]+[Shift]+[D]
// インデントの調整は [Tab] or [Shift]+[Tab]

////■■■■■■■■■■■■■■形状の作成■■■■■■■■■■■■■■

//直方体
//sc0=[7,7,20];
//cube(sc0);
//cube(sc0, center = true);
//cube(sc0, center = false);
//

////球
//sphere(r = 10, $fn = 64);

////円柱
//cylinder(h = 30, r = 10, center = true, $fn = 64);

////円錐の上部を切ったやつ
//cylinder(h = 30, r1 = 20, r2 = 10, center = true, $fn = 64);

//cylinder(h = 30, r1 = 10, r2 = 0, center = false, $fn = 4);


////■■■■■■■■■■■■■■記法(一般)■■■■■■■■■■■■■■
//　　xxx(arg_xxx){
// 　　   yyy(arg_yyy);
//　　}
//xxx:操作命令(形状の移動や編集のコマンド)
//yyy:アクション命令(形状作成のコマンド)
//arg_xxx, arg_yyy:各コマンドの設定値


////■■■■■■■■■■■■■■形状の編集■■■■■■■■■■■■■■

////倍率の変更
//mg0=[1,1,0.3];
//scale(mg0){
//    sphere(r = 10, $fn = 64);
//}

//リサイズ
//sc0=[10,7,20];
//rs0=[5,0,15]; //0は変化させない場合
//resize(rs0){
//    cube(sc0);
//}


////■■■■■■■■■■■■■■形状の移動■■■■■■■■■■■■■■

////平行移動
//sc0=[10,7,20];
//tr0=[10,0,0];
//translate(tr0){
//    cube(sc0);
//}

////回転（中心:原点）
//sc0=[10,7,20];
//rt0=[30,0,0];//x軸まわりに30度回転
//rotate(rt0){
//    cube(sc0);
//}

//平行移動→回転(順番注意)
//sc0=[5,5,10];
//tr0=[10,0,0];//x軸方向に10平行移動
//rt0=[0,0,30];//z軸まわりに60度回転
//rotate(rt0){
//    translate(tr0){
//        cube(sc0);
//        }
//}

////面対称移動（基準面:原点を通る面）
//sc0=[5,5,10];
//mr0=[1,0,0];//基準面の法線ベクトル
//mirror(mr0){
//    cube(sc0);
//}

////

////■■■■■■■■■■■■■■形状同士の演算■■■■■■■■■■■■■■

// 第1引数の図形から第2引数以降の図形を引く
//difference() {
//    cylinder(h = 60, r1=15, r2=20, $fn=144, center = true);
//    cylinder(h = 70, r1=10, r2=5, $fn=144, center = true);
//    cube([100,7,20], center = true);
//}

// 引数の図形を全て足す
//union() {
//    cylinder(h = 60, r1=15, r2=20, $fn=144, center = true);
//    cylinder(h = 70, r1=10, r2=5, $fn=144, center = true);
//    cube([100,7,20], center = true);
//}




////■■■■■■■■■■■■■■繰り返し操作■■■■■■■■■■■■■■
//n  = 1; //円柱の本数(繰り返し数)
//d1 = 2;
//d2 = 2;
//h  = 50;
//rt1 = [0,40,40];
//tr0 = [5,0,0];
//for (i = [1:n]){
//    rt2  =[0,0,360/n*(i-1)];
//    rotate(rt2){
//        translate(tr0){
//            rotate(rt1){
//                cylinder(r1=d1/2,r2=d2/2,h=h,$fn=16,center=true);
//            }
//        }
//    }
//}



////■■■■■■■■■■■■■■その他便利なコマンド■■■■■■■■■■■■■■
// * : 命令の無効化
// # : オブジェクトの特定
// % : 命令の半無効化
// ! : 命令のソロ化(他の命令を無効化する．一つに注目したいときに使う)




////■■■■■■■■■■■■■■メッシュの作成■■■■■■■■■■■■■■
//points_1=[
//    [0,0,1],
//    [0,0,0],
//    [1,0,0],
//    [0,1,0]
//];
//faces_1=[
//    [0,2,1], //各面の頂点を時計回りに指定
//    [0,3,2],
//    [0,1,3],
//    [1,2,3]
//];
//polyhedron(
//    points=points_1,
//    faces=faces_1
//);

