import '../../model.dart';

final definitionOfElectricField = TheoryTopic(
  title: '電場の定義',
  latexContent: r"""
<div class="theory-common-box">定義（電場の大きさ）</div>
・磁場 $\vec{B}$ が存在しない場合、点電荷 $q$ に働く力 $\vec{F}$ から電場 $\vec{E}$ の大きさを下記の通り定義する。
\[
\vec{E} = \frac{\vec{F}}{q}
\]
※ この定義は 電荷 $q$ が既知としている。

<div class="theory-common-box">定義（電場の向き）</div>
・電場の向きは、正の電荷に働く力の向きと同じとする。<br>
・負の電荷の場合、力の向きは電場の向きと逆になる。
""",
);
