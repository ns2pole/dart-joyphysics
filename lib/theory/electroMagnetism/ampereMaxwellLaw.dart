import '../../model.dart';

final ampereMaxwellLaw = TheoryTopic(
  title: 'アンペール・マクスウェルの法則',
  latexContent: r"""

<div class="theory-common-box">定義（変位電流）</div>
<p>
真空の誘電率 $\varepsilon_0$と電場の流束 \(\displaystyle \iint_S \vec E\cdot d\vec S\) の積の時間微分 \( \displaystyle \frac{d}{dt} \Biggl(\varepsilon_0 \iint_S \vec E\cdot d\vec S \Biggr)\) を変位電流という。
</p>

<div class="theory-common-box">アンペール・マクスウェルの法則（積分形）</div>
<p>
「電流と変位電流が磁場の回転を生じさせる」 この法則をアンペール・マクスウェルの法則といい、下式で表される。
\[
\oint_{\partial S} \vec{B}\cdot d\vec{r} = \mu_0 \Biggr( \sum_{Sを貫く} I + \varepsilon_0 \frac{d}{dt}\iint_S \vec{E}\cdot d\vec{S} \Biggl)
\]
※ 面 \(S\) の法線ベクトル \(\vec{n}\) と境界 \(\partial S\) の積分方向は右手則で連動して決める。<br>
※ アンペール・マクスウェルの法則は物質中でも勿論成り立つのだが、物質中の電磁場については自由に動くことのできる自由電子による電荷や電流と、そうでない束縛を受けている電子の電荷や電流に分けて$\vec D, \vec H$表式に変える事がよく行われる。
</p>

<div class="theory-common-box">定理：アンペールの法則
電場が時間的に変化しない場合、下記のアンペールの法則を得る。
\[
\oint_{\partial S} \vec{B}\cdot d\vec{r} = \mu_0 \sum_{Sを貫く} I 
\]
</div>

<p><div class="proof-box">証明</div>
仮定より、変位電流項$\Biggr( \displaystyle  \varepsilon_0 \frac{d}{dt}\iint_S \vec{E}\cdot d\vec{S} \Biggl)$が消えて、
アンペール・マクスウェルの法則より直ちにアンペールの法則を得る。
</p>

<div class="theory-common-box">定義（光速：真空中 \(c\)）</div>
<p>
真空中の光速は真空の誘電率と透磁率から決まり、下記となる。
\[
\displaystyle c=\frac{1}{\sqrt{\varepsilon_0\mu_0}}\fallingdotseq 2.99792458\times10^{8}\ \mathrm{m/s}
\]
※光速を用いると、アンペール・マクスウェルの法則は$\displaystyle \oint_{\partial S} \vec{B}\cdot d\vec{r} = \mu_0 \sum_{Sを貫く} I + \frac{1}{c^2} \frac{d}{dt}\iint_S \vec{E}\cdot d\vec{S}$と表すことができる。
</p>


""",
);
// <div class="theory-common-box">補足（磁場のエネルギー）</div>
// <p>
// 線形媒質において、磁場に蓄えられる単位体積当たりのエネルギー密度は
// \[
// w_{\mathrm{mag}} = \tfrac{1}{2}\vec B\cdot\vec H
// \]
// で与えられる。全エネルギーはこれを体積積分することで求められる。
// </p>