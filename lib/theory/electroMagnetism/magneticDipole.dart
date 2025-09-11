import '../../model.dart';

final magneticDipole = TheoryTopic(
  title: '磁気双極子 — 定義と命題例',
  latexContent: r"""

<div class="theory-common-box">命題：単一磁荷が作る場（磁荷モデル）</div>
<p>
磁荷モデルを仮定するならば、点磁荷 \(q_m\) が位置 \(\vec r_q\) に存在するときに作る磁場は逆二乗則の場として表される：
\[
\vec B_{q}(\vec r) = \frac{\mu_0}{4\pi}\, q_m\frac{\vec r-\vec r_q}{|\vec r-\vec r_q|^3}.
\]
※ 実際には、磁荷は未だ未発見なため、このモデルは便宜的・概念的な扱いであることに注意。
</p>


<div class="theory-common-box">命題：テイラー展開</div>
$|\vec {\epsilon}|$が$|\vec r|$に比べて十分小さい時、$|\vec r + \vec \epsilon|^{-3} $の値は下記で近似できる。
\[
r^{-3} \left( 1 - 3 \frac{\hat r \cdot \vec \epsilon}{r} \right),
\]

<div class="proof-box">証明</div>
<p>
\begin{aligned}
&\ \ |\vec r+\vec\epsilon|^{-3}\\[6pt]
&=(|\vec r+\vec\epsilon|^2)^{-\frac 2 3}\\[6pt]
&=\bigl((\vec r+\vec\epsilon) \cdot (\vec r+ \vec \epsilon) )\bigr) ^{-\frac 2 3}\\[6pt]
&=\bigl(|\vec r|^2+2 \vec v \cdot \vec \epsilon+ |\epsilon|^2\bigr) ^{-\frac 2 3}\\[6pt]
&=\bigl(r^2+2 \vec v \cdot \vec \epsilon+ \epsilon^2 \bigr) ^{-\frac 2 3}\\[6pt]
&=\Biggl(r^{2}\Bigl(1+2 \frac {\vec v \cdot \vec \epsilon}{r^2}+ \frac {\epsilon^2}{r^2} \Bigr)\Biggr) ^{-\frac 2 3}\\[6pt]
&=r^{-3} \Bigl(1+2 \frac {\vec v \cdot \vec \epsilon}{r^2}+ \frac {\epsilon^2}{r^2} \Bigr) ^{-\frac 2 3}\\[6pt]
&=r^{-3} \Bigl(1+x \Bigr) ^{-\frac 2 3}\ \ ;\ \ x:=2\frac{\vec r\cdot\vec\epsilon}{r^2}+\frac{\epsilon^2}{r^2}.
\end{aligned}

二項展開の一次まで取ると
\[
(1+x)^{-3/2}\fallingdotseq 1-\frac{3}{2}x.
\]

したがって
\begin{aligned}
|\vec r+\vec\epsilon|^{-3}&\fallingdotseq r^{-3}\Bigl(1-\frac{3}{2}\Bigl(2\frac{\vec r\cdot\vec\epsilon}{r^2}+\frac{\epsilon^2}{r^2}\Bigr)\Bigr)\\[6pt]
&= r^{-3}\Bigl(1-3\frac{\vec r\cdot\vec\epsilon}{r^2}-\frac{3}{2}\frac{\epsilon^2}{r^2}\Bigr).
\end{aligned}
さらに、 $\epsilon$ の1次まで残すと
\[
|\vec r+\vec\epsilon|^{-3}\fallingdotseq r^{-3}\Bigl(1-3\frac{\vec r\cdot\vec\epsilon}{r^2}\Bigr)
\Bigr).
\]
Q.E.D
</p>

<div class="theory-common-box">命題（磁荷モデルによる磁気双極子の作る磁場）：
大きさが等しく符号が反対の磁荷 \(\pm q_m\)が、位置$\displaystyle \pm \frac {1}{2} {\vec d}$に存在する時、\(|\vec d|\ll |\vec r|\) の位置における磁場は下記で近似できる。
\[
\vec B(\vec r)=\frac{\mu_0}{4\pi r^3}\Bigl(-\vec m + 3(\vec m\cdot\hat r)\hat r\Bigr),
\]
ただし \(\vec m=q_m\vec d\), \(r=|\vec r|,\ \hat r=\displaystyle \frac{\vec r}{r}\) である。</div>
<div class="paragraph-box">証明</div>
<p>
2つの磁荷による合成磁場は
\[
\vec B(\vec r) = \vec B_+ + \vec B_- = \frac{\mu_0}{4\pi} q_m \left( \frac{\vec r - \frac{1}{2}\vec d}{|\vec r - \frac{1}{2}\vec d|^3} - \frac{\vec r + \frac{1}{2}\vec d}{|\vec r + \frac{1}{2}\vec d|^3} \right).
\]

上の近似評価の命題に、\(\vec \epsilon = \pm \vec d / 2\) を代入して計算を行うと、
\[
\frac{1}{|\vec r \pm \frac{1}{2}\vec d|^3} \fallingdotseq \frac{1}{r^3} \left( 1 \mp 3 \frac{\vec r \cdot \vec d}{2 r^2} \right)
\]
となる。
よって、$\displaystyle \vec r \mp \frac{1}{2}\vec d $を掛け合わせると
これに分子 \(\vec r\mp\tfrac12\vec d\) を掛けた一次展開をそのまま書くと、
\[
\frac{\vec r-\tfrac12\vec d}{\bigl|\vec r-\tfrac12\vec d\bigr|^3}=\frac{\vec r}{r^3}-\frac{\vec d}{2r^3}+\frac{3(\vec r\cdot\vec d)\,\vec r}{2r^5}+O\!\Bigl(\frac{|\vec d|^2}{r^4}\Bigr),
\]
\[
\frac{\vec r+\tfrac12\vec d}{\bigl|\vec r+\tfrac12\vec d\bigr|^3}=\frac{\vec r}{r^3}+\frac{\vec d}{2r^3}-\frac{3(\vec r\cdot\vec d)\,\vec r}{2r^5}+O\!\Bigl(\frac{|\vec d|^2}{r^4}\Bigr).
\]
差を取ると 0 次の項 \(\vec r/r^3\) は打ち消され、一次の項のみが残る：
\[
\frac{\vec r-\tfrac12\vec d}{\bigl|\vec r-\tfrac12\vec d\bigr|^3}-\frac{\vec r+\tfrac12\vec d}{\bigl|\vec r+\tfrac12\vec d\bigr|^3}
= -\frac{\vec d}{r^3}+\frac{3(\vec r\cdot\vec d)\,\vec r}{r^5}+O\!\Bigl(\frac{|\vec d|^2}{r^4}\Bigr).
\]

この式の結果に係数 \(\dfrac{\mu_0}{4\pi}q_m\) を掛けたものが磁場であるので、$\displaystyle \vec m=q_m\vec d,\ \hat r=\frac {\vec r}{r}$とすると、結局
\begin{aligned}
&\ \ \vec B(\vec r)\\[6pt]
&\fallingdotseq \frac{\mu_0 }{4\pi r^3} \Biggl( - {q_m \vec d}+\frac{3(\vec r\cdot\vec d)\,\vec r}{r^2}\Biggr)+O\!\Bigl(\frac{|\vec d|^3}{r^5}\Bigr)\\[5pt]
&\fallingdotseq \frac{\mu_0 }{4\pi r^3} \Biggl( - {q_m \vec d}+3 \frac{\vec r}{r} \cdot\vec d \frac{\vec r}{r} \Biggr)+O\!\Bigl(\frac{|\vec d|^3}{r^5}\Bigr)\\[5pt]
&\fallingdotseq \frac{\mu_0 }{4\pi r^3} \Biggl( - {q_m \vec d}+3 \frac{\vec r}{r} \cdot\vec d \frac{\vec r}{r} \Biggr)+O\!\Bigl(\frac{|\vec d|^3}{r^5}\Bigr)\\[5pt]
&\fallingdotseq \frac{\mu_0}{4\pi r^3} \Bigl(- \vec m + 3(\vec m\cdot\hat r)\,\hat r \Bigr) + O\!\Bigl(\frac{|\vec d|^3}{r^5}\Bigr)
\end{aligned}
ここで$|\vec d|$の2次以上を切り捨てると命題の近似式が得られる。
</p>



<div class="theory-common-box">定義（磁気双極子モーメント）</div>
<p>
平面の電流ループに対して、磁気双極子モーメント \(\vec m\) を下記で定義する。
\[
\vec m = I\,\vec S
\]
ここで \(I\) はループ電流、\(\vec S\) はループの面積ベクトル（ベクトルの大きさは面積で、向きは右ねじの法則で定まる向き）である。
</p>

<div class="theory-common-box">例：正方形ループの磁気モーメント</div>
<p>
一辺の長さ \(a\) の正方形ループに電流 \(I\) が流れている時、電流ループの磁気モーメントは下記で与えられる。
\[
\vec m = I a^2\,\hat n
\]
</p>

<div class="theory-common-box">命題：ループ電流に働くトルク</div>
<p>
閉じた電流ループが外部一様磁場 \(\vec B\) を受けるとき、ループが受けるトルク \(\boldsymbol{\tau}\) は下記となる。
\[
\boldsymbol{\tau}=\vec m\times\vec B
\]
である。
</p>

<div class="paragraph-box">証明</div>
<p>
微小線分に働く力はアンペール力の法則より \(d\vec F=I\,d\vec \ell\times\vec B\) である。トルクは
\[
\boldsymbol{\tau}=\oint_{C}\vec r\times d\vec F=I\oint_{C}\vec r\times(d\vec\ell\times\vec B).
\]
ここで恒等式 \(\vec a\times(\vec b\times\vec c)=\vec b(\vec a\cdot\vec c)-\vec c(\vec a\cdot\vec b)\) を用いると
\[
\vec r\times(d\vec\ell\times\vec B)=d\vec\ell\, (\vec r\cdot\vec B)-\vec B\, (\vec r\cdot d\vec\ell).
\]
これを積分すると，第二項は閉路上での全微分の積分になり消える：\(\oint \vec r\cdot d\vec\ell=0\)。したがって
\[
\boldsymbol{\tau}=I\oint_{C}d\vec\ell\, (\vec r\cdot\vec B).
\]
ここで補助恒等式（積分による部分積分に相当する操作）を使うと
\[
\oint_{C}d\vec\ell\, (\vec r\cdot\vec B)=\tfrac{1}{2}\Bigl(\oint_{C}\vec r\times d\vec r\Bigr)\times\vec B
\]
が成り立つ（証明：右辺を恒等式 \((\vec r\times d\vec r)\times\vec B=d\vec r\, (\vec r\cdot\vec B)-\vec r\, (d\vec r\cdot\vec B)\) により展開し，閉路上の全微分項が打ち消されることを利用する）。
これを用いると
\[
\boldsymbol{\tau}=I\cdot\tfrac{1}{2}\Bigl(\oint_{C}\vec r\times d\vec r\Bigr)\times\vec B.
\]
さらに面積ベクトルの定義 \(\vec S=\tfrac{1}{2}\oint_{C}\vec r\times d\vec r\) と \(\vec m=I\vec S\) を代入すると、最終的に
\[
\boldsymbol{\tau}=\vec m\times\vec B
\]
が得られる。
</p>


<div class="theory-common-box">命題：遠方の磁場は双極子場に一致する</div>
<p>
電流ループが作る磁場は、観測点がループから十分遠い(（\r\gg\)ループサイズ)ならば、磁気双極子場の形に近似できる。
</p>

<div class="paragraph-box">証明（ベクトルポテンシャルを使わない Biot–Savart 展開のスケッチ）</div>
<p>
ループ電流が作る磁場は Biot–Savart の法則で与えられる：
\[
\vec B(\vec r)=\frac{\mu_0 I}{4\pi}\oint_C \frac{d\vec\ell'\times(\vec r-\vec r')}{|\vec r-\vec r'|^3},
\]
ここで \(\vec r'\) はループ上の積分変数（ループ内位置）、\(\vec r\) は観測点を表す。遠方 \(r\gg |\vec r'|\) を仮定し、分母の逆三乗を多項展開する：
\[
\frac{1}{|\vec r-\vec r'|^3}=\frac{1}{r^3}\Bigl(1-3\frac{\vec r\cdot\vec r'}{r^2}+O\bigl((r'/r)^2\bigr)\Bigr).
\]
分子は \(d\vec\ell'\times(\vec r-\vec r')=d\vec\ell'\times\vec r - d\vec\ell'\times\vec r'\) と分けられる。これらを展開して積分し、以下の事実を利用する：
\begin{itemize}
  \item 閉曲線上の線素の和は零： \(\displaystyle\oint_C d\vec\ell'=\vec0\)。
  \item 面積ベクトルはループ積分で表せる： \(\displaystyle\vec S=\tfrac{1}{2}\oint_C \vec r'\times d\vec\ell'\)（したがって \(\displaystyle\oint_C \vec r'\times d\vec\ell' = 2\vec S\)）。
\end{itemize}
主要な寄与（一次まで）を残して整理すると、角度依存性を持つ双極子項が現れる。最終的に
\[
\vec B(\vec r)=\frac{\mu_0}{4\pi r^3}\Bigl(3(\vec m\cdot\hat r)\hat r-\vec m\Bigr)+O\bigl(r^{-4}\bigr),
\]
が得られる。ここで磁気双極子モーメント \(\vec m\) は \(\vec m=I\vec S\) で与えられる。  
</p>

""",
);
