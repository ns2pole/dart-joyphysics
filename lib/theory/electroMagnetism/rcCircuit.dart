import '../../model.dart';

final rcCircuitTheory = TheoryTopic(
  title: 'RC回路(充電)',
  videoURL: "oVY3-umLN14",
  imageAsset: 'assets/mindMap/forTopics/rcCircuit.png', // 実際の画像パス
  latexContent: r"""

<div class="theory-common-box">定義(RC回路)</div>
・抵抗 ${R}$とコンデンサー ${C}$ を直列につないだ回路を RC 回路と呼ぶ。<br>
・RC 回路は電荷の蓄積と放出に伴う時間的な電圧変化を記述する回路である。<br>
  <div style="text-align:center; margin:1em 0;">
    <img src="assets/electroMagnetismTheory/rcCircuit.png"
          alt=""
          style="max-width:75%; height:auto;" />
  </div>
<div class="theory-common-box">記号と符号規約</div>
・${V_0}$：電源電圧<br>
・${V_c(t)}$：コンデンサー電圧(コンデンサーの正板と負板の電位差)<br>
・${I(t)}$：回路を流れる電流(正方向は電源から抵抗を通ってコンデンサーに向かう向きと定義)<br>
・${Q(t)}$：コンデンサーの電荷。正板に蓄えられる電荷量を意味し，${Q(t)=C\,V_c(t)}$ の関係を満たす(符号は上記の向きに合わせる)<br>

<div class="theory-common-box">基本方程式(キルヒホッフ)</div>
・キルヒホッフの法則により，電源電圧は抵抗での電圧降下とコンデンサー電圧の和に等しい：
$${\displaystyle R\,I(t) + V_c(t)=V_0}$$
・コンデンサーに流れる電流は電荷の時間変化で表される：
$${\displaystyle I(t)= Q'(t)=C\,V_c'(t)}$$
これらを組み合わせると基礎的な微分方程式が得られる
$${\displaystyle RC\,V_c'(t) + V_c(t) = V_0}$$


<div class="theory-common-box">命題 1(基礎方程式の導出)：コンデンサー極板間電圧の時間発展は次の微分方程式で記述される：
${\displaystyle RC\,V_c'(t) + V_c(t) = V_0.}$
</div>

<div class="proof-box">証明</div><p>
電源から抵抗を経てコンデンサーへ流れる電流が ${\displaystyle I(t)}$ なので、オームの法則より抵抗に生じる電圧降下は ${\displaystyle R\,I(t)}$ であり，回路を一周すると総和が電源電圧に等しいため
${\displaystyle R\,I(t)+V_c(t)=V_0}$
である。<br>
また、コンデンサーに流れる電流は電荷の時間変化に等しく，${\displaystyle I(t)=Q'(t)}$，かつ ${\displaystyle Q=C\,V_c}$ であるから
$${\displaystyle I(t)=C\,V_c'(t)}$$
これを先の式に代入して整理すると
\begin{aligned}
& R\bigl(C\,V_c'(t)\bigr)+V_c(t)=V_0\\[6pt]
\Leftrightarrow \ \  & RC\,V_c'(t)+V_c(t)=V_0
\end{aligned}
が得られる。　Q.E.D

</p><div class="theory-common-box">命題 2(特解と斉次形への変換)：非斉次方程式
微分方程式${\displaystyle RC\,V_c'(t)+V_c(t)=V_0}$
の定数解は ${\displaystyle V_p=V_0}$ である。
</div>

<div class="proof-box">証明</div><p>
微分方程式${\displaystyle RC\,V_c'(t)+V_c(t)=V_0}$の定数関数解 ${V_p}$を探す。${V_p' = 0}$ であるから，元の方程式に代入すると
$${RC\cdot 0 + V_p = V_0}$$
が得られる。したがって ${V_p=V_0}$　Q.E.D


</p><div class="theory-common-box">命題 3(特解と斉次形への変換)：非斉次方程式
${\displaystyle RC\,V_c'(t)+V_c(t)=V_0}$
ならば，$u(t):=V_c(t)-V_p$ は、下記の微分方程式を満たす。
$$RC\,u'(t) + u(t) = 0$$
</div>

<div class="proof-box">証明</div><p>
命題2より、定数$V_0$は微分方程式${\displaystyle RC\,V_c'(t)+V_c(t)=V_0}$
の解であるから、下式が成り立つ。
$$
\displaystyle RC\,V_0'+ V_0=V_0
$$
この式を微分方程式から引き算すると、
\begin{aligned}
&RC\,(V_c'(t)-V_0')+V_c(t)-V_0=V_0-V_0\\[6pt]
\Leftrightarrow \ & RC\,(V_c(t)-V_0)'+V_c(t)-V_0=0
\end{aligned}
ここで，${u(t):=V_c(t)-V_0}$ とおくと，
$${RC\,u'(t) + u(t) = 0}$$
が得られる。　Q.E.D

</p><div class="theory-common-box">命題 4(斉次方程式の解：指数関数解)：斉次方程式${\displaystyle RC\,u'(t)+u(t)=0}$の解は、下記で表される。
$${\displaystyle u(t)=u(0)\,e^{-\frac{t}{RC}}}$$</div>

<div class="proof-box">証明</div><p>
上の命題の式の両辺$をRC\cdot u(t)$で割って、変数分離すると、下式を得る。
$${\frac{1}{u(t)}u'(t)=-\frac{1}{RC}}$$
これを時刻 $t'$ を変数として $0$ から $t$ まで積分すると， $${\int_{0}^{t}\frac{1}{u(t')}\frac{du}{dt'}\,dt'=\int_{0}^{t}-\frac{1}{RC}\,dt'}$$ となる。<br> 
<div class="paragraph-box">右辺</div><br> 
定数の定積分により${\displaystyle -\frac{t}{RC}}$ となる。<br> 
<div class="paragraph-box">左辺</div><br> 
置換 $s=u(t')$ により \begin{aligned} \int_{u(0)}^{u(t)}\frac{1}{s}\,ds &=\ln|u(t)|-\ln|u(0)|\\[6pt] &=\ln\!\Biggl(\frac{|u(t)|}{|u(0)|}\Biggr) \end{aligned} となる。<br><br> 
以上より、右辺=左辺なので、$${\ln\!\Biggl(\frac{|u(t)|}{|u(0)|}\Biggr)=-\frac{t}{RC}}$$ 
ここで両辺の指数を取って下式が得られる。　
$${u(t)=u(0)\,e^{-\frac {t} {RC}}}$$　Q.E.D

</p><div class="theory-common-box">命題 5(充電過程の解)：初期条件 ${\displaystyle V_c(0)=0}$ のもとで，非斉次方程式
${\displaystyle RC\,V_c'(t)+V_c(t)=V_0}$
の解は下記となる。
$${\displaystyle V_c(t)=V_0\bigl(1-e^{-\frac{t}{RC}}\bigr)}$$
</div>

<div class="proof-box">証明</div><p>
命題 2 より ${\displaystyle V_c(t)=V_p+u(t)}$，${\displaystyle V_p=V_0}$，命題 3 より ${\displaystyle u(t)=u(0)e^{-\frac{t}{RC}}}$ である。初期条件から
${\displaystyle u(0)=V_c(0)-V_p=0-V_0=-V_0}$
であるため
${\displaystyle V_c(t)=V_0 + \bigl(-V_0\bigr)e^{-\frac{t}{RC}} = V_0\bigl(1-e^{-\frac{t}{RC}}\bigr)}$
となる。　Q.E.D

</p><div class="theory-common-box">命題 6(電流式と初期電流)：充電過程における回路電流は下記で表される。
$${\displaystyle I(t)=\frac{V_0}{R}\,e^{-\frac{t}{RC}}}$$
※特に、初期電流は${\displaystyle I(0)=\frac{V_0}{R}}$である。
</div>

<div class="proof-box">証明</div><p>
電流は ${\displaystyle I(t)=C\,V_c'(t)}$ である。命題 5 の ${\displaystyle V_c(t)=V_0(1-e^{-\frac{t}{RC}})}$ を微分すると
${\displaystyle V_c'(t)=V_0\cdot\frac{1}{RC}e^{-\frac{t}{RC}}}$
であるから
${\displaystyle I(t)=C\cdot V_0\cdot\frac{1}{RC}e^{-\frac{t}{RC}}=\frac{V_0}{R}e^{-\frac{t}{RC}}}$
となる。<br>
※特に$t=0$ を代入すれば ${\displaystyle I(0)=\frac{V_0}{R}}$ となる。　Q.E.D

</p><div class="theory-common-box">補足：時定数</div>
時定数 ${\displaystyle \tau=RC}$ は時間の尺度を与え，充電・放電の指数的変化の速さを決定する。特に ${\displaystyle t=\tau}$ において
${\displaystyle V_c(\tau)=V_0(1-e^{-1})\fallingdotseq 0.632\,V_0}$
が成立する。

""",
);

// 放電の時
// 図を入れる
// いいのを1個作ってそれ使ってLCRL LRCを作る
// 常微分方程式の解の一意性調べる