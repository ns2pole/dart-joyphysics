import '../../model.dart';

final electoricGaussLaw = TheoryTopic(
  title: '電場のガウスの法則',
  imageAsscet: 'assets/mindMap/forTopics/electoricGaussLaw.png',

  latexContent: r"""
<div class="theory-common-box">法則（電荷と電場とガウスの法則）：任意の閉曲面$S$に対し、下記が成り立つ。この法則を電場のガウスの法則という。
$$
\oint_{S} \vec{E}\cdot d\vec{S} = \frac{1}{\varepsilon_0} \displaystyle \sum_{S内部} Q
$$
※$\varepsilon_0 = \fallingdotseq 8.854 \times 10^{-12}\ \mathrm{F/m}$ : 真空の誘電率(定数)

</div>
<div class="paragraph-box">説明</div><br>
・右辺：閉曲面を通る電場の総流束（外向き正）<br>
・左辺：閉曲面の内部に含まれる全電気量<br>
・電場のガウスの法則は正の電荷からは電場が湧き出し、負の電荷は電場を吸い込む事を表している。<br>
・電場の総流束は閉曲面内部に含まれる全電気量に比例し、比例定数は真空の誘電率$\varepsilon_0$の逆数である。<br>
※ 電場のガウスの法則は勿論物質中でも成り立つのだが、物質中の電磁場については自由に動くことのできる自由電子の電荷と、そうでない誘電体の中の電荷に分けて$\vec D$を用いた表式に変える事がよく行われる。
""",
);