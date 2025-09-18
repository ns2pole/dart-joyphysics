import '../../model.dart';

final rcCircuitDischarge = TheoryTopic(
  title: 'RC回路(放電)',
  imageAsset: 'assets/mindMap/forTopics/rcCircuit.png',
  latexContent: r"""

<div class="theory-common-box">定義(RC回路 — 放電)</div>
・抵抗 ${R}$ とコンデンサー ${C}$ を直列につないだ回路において，コンデンサーがあらかじめ電荷を蓄えており（初期電圧 ${\displaystyle V_c(0)=V_0}$），外部の電源が取り除かれた（短絡またはスイッチで閉路が形成された）ときに起こる電圧・電流の時間変化を「放電」と呼ぶ。<br>
・放電ではコンデンサーに蓄えられた電荷が抵抗を通じて放出され，コンデンサー電圧は時間とともに減衰する。<br>
  <div style="text-align:center; margin:1em 0;">
    <img src="assets/electroMagnetismTheory/rcCircuitDischarge.png"
         alt=""
         style="max-width:75%; height:auto;" />
  </div>

<div class="theory-common-box">記号と符号規約</div>
・${V_0}$：放電開始直前のコンデンサー電圧（初期電圧）${\displaystyle V_c(0)=V_0}$。<br>
・${V_c(t)}$：コンデンサーの電圧（正板と負板の電位差）。<br>
・${I(t)}$：回路を流れる電流。符号は「抵抗からコンデンサーに向かう方向（充電時と同じ向き）」を正と定義する（この符号規約により放電では${I(t)}$は負となる）。<br>
・${Q(t)}$：コンデンサーに蓄えられた電荷（正板の電荷）。${\displaystyle Q(t)=C\,V_c(t)}$ が成り立つ（符号は上記の向きに合わせる）。<br>

<div class="theory-common-box">基本方程式(キルヒホッフ)</div>
・電源が外された回路を一周すると，抵抗での電圧降下とコンデンサー電圧の和はゼロである（電源項がないため）：
$${\displaystyle R\,I(t) + V_c(t)=0}$$
・コンデンサーに流れる電流は電荷の時間変化で表される：
$${\displaystyle I(t)=Q'(t)=C\,V_c'(t)}$$
これらを組み合わせると放電を支配する基礎的な微分方程式が得られる：
$${\displaystyle RC\,V_c'(t) + V_c(t) = 0}$$

<div class="theory-common-box">命題 1（基礎方程式の導出）：コンデンサー極板間電圧の時間発展は次の微分方程式で記述される：
$${\displaystyle RC\,V_c'(t) + V_c(t) = 0}$$
</div>

<div class="proof-box">証明</div><p>
回路を一周して抵抗とコンデンサーの両端電圧の和を取ると電源が無いため
$${\displaystyle R\,I(t) + V_c(t)=0}$$
が成り立つ。さらにコンデンサーに流れる電流は電荷の時間変化であり，${\displaystyle I(t)=Q'(t)}$，かつ ${\displaystyle Q=C\,V_c}$ なので
$${\displaystyle I(t)=C\,V_c'(t)}$$
である。これを先の式に代入して整理すれば
$$
\begin{aligned}
R\bigl(C\,V_c'(t)\bigr)+V_c(t)&=0
\end{aligned}
$$
すなわち
$$
\begin{aligned}
RC\,V_c'(t)+V_c(t)&=0
\end{aligned}
$$
が得られる。　Q.E.D
</p>

<div class="theory-common-box">命題 2（放電過程の解）：初期条件 ${\displaystyle V_c(0)=V_0}$ のもとで，微分方程式
$${\displaystyle RC\,V_c'(t)+V_c(t)=0}$$
の解は次のようになる：
$${\displaystyle V_c(t)=V_0\,e^{-\frac{t}{RC}}}$$
</div>
<div class="proof-box">証明</div><p>
<a href="app://topic?video=rcCircuit">充電過程の記事</a>の命題4より成り立つ。
</p>
<div class="theory-common-box">命題 3（電流式と初期電流）：放電過程における回路電流は次で与えられる：
$${\displaystyle I(t)=C\,V_c'(t) = -\frac{V_0}{R}\,e^{-\frac{t}{RC}}}$$
特に初期電流は ${\displaystyle I(0)=-\frac{V_0}{R}}$ であり，符号は定義した正方向に対して逆向きであることを意味する。
</div>

<div class="proof-box">証明</div><p>
電流は ${\displaystyle I(t)=C\,V_c'(t)}$ である。命題2より
$$
\begin{aligned}
V_c'(t) &= V_0\cdot\left(-\frac{1}{RC}\right) e^{-\frac{t}{RC}} \\[6pt]
&= -\frac{V_0}{RC}\,e^{-\frac{t}{RC}}
\end{aligned}
$$
したがって
$$
\begin{aligned}
I(t) &= C\cdot\left(-\frac{V_0}{RC}\,e^{-\frac{t}{RC}}\right)\\[6pt]
&= -\frac{V_0}{R}\,e^{-\frac{t}{RC}}
\end{aligned}
$$
$t=0$ を代入すると ${\displaystyle I(0)=-\frac{V_0}{R}}$ となる。　Q.E.D
</p>

<div class="theory-common-box">命題 4（常微分方程式の解の一意性）</div>
一階線形常微分方程式
\[
RC\,V_c'(t) + V_c(t) = 0
\]
は連続係数を持つ線形方程式であり，任意の初期条件 ${\displaystyle V_c(0)=V_0}$ に対して解は一意に存在する。

<div class="proof-box">証明</div><p>
同じ初期条件を満たす二つの解 ${\displaystyle V_1(t)}$ と ${\displaystyle V_2(t)}$ があると仮定する。差 ${\displaystyle w(t):=V_1(t)-V_2(t)}$ を取ると，両者が元の方程式を満たすことから
$$
\begin{aligned}
RC\,w'(t) + w(t) &= 0
\end{aligned}
$$
かつ初期条件により ${\displaystyle w(0)=0}$ である。命題2 の解法と同様にして $w(t)=w(0)e^{-t/RC}=0$ となるため，${\displaystyle V_1(t)=V_2(t)}$ が従い解は一意である。(存在については<a href="app://topic?video=rcCircuit">充電過程の記事</a>命題4で構成できる)　Q.E.D
</p>

<div class="theory-common-box">補遺：時定数と物理的意味</div>
時定数 ${\displaystyle \tau=RC}$ は放電の指数減衰の時間尺度を与える。特に ${\displaystyle t=\tau}$ において
$$
\begin{aligned}
V_c(\tau) = V_0\,e^{-1} \fallingdotseq 0.368\,V_0
\end{aligned}
$$
すなわち初期値の約 $36.8\%$ に減衰する。電流の絶対値も同様の指数減衰を示す。

<div class="theory-common-box">まとめ</div>
・放電ではコンデンサー電圧は指数関数的に減衰し，$V_c(t)=V_0 e^{-t/RC}$ が成り立つ。<br>
・回路電流は $I(t)=-\dfrac{V_0}{R}e^{-t/RC}$ であり，定義した正方向に対しては負（すなわち実際の流れは逆向き）である。<br>
・時定数 $\tau=RC$ が放電の速さを決める。<br>
・方程式は一階線形常微分方程式であり，任意の初期条件に対して解は一意に存在する。

""",
);
