import '../../model.dart';

final definitionOfMagneticField = TheoryTopic(
  title: '磁束密度の定義',
  imageAsscet: 'assets/mindMap/forTopics/definitionOfMagneticField.png',

  latexContent: r"""
<div class="theory-common-box">定義（磁束密度の大きさ）</div>
・長さ $\ell$ の導線に電流 $I_0$ が流れる時、導線に働く力 $\vec{F}$ によって、磁束密度の大きさ$|\vec B|$を下記の通り定義する。
$$
\vec{B} = \frac{\vec{F}}{I_0 \ell}
$$
<div class="theory-common-box">定義（磁束密度の向き）</div>
・磁束密度の向きは、常に電流の向きと力の向きの両方に垂直とし、右手の法則で定める。
""",
);