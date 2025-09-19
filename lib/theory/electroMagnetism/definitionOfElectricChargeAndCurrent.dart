import '../../model.dart';

final definitionOfElectricChargeAndCurrent = TheoryTopic(
  title: '電荷,電流の定義',
  imageAsscet: 'assets/mindMap/forTopics/definitionOfElectricChargeAndCurrent.png',

  latexContent: r"""
<div class="theory-common-box">定義（電荷）</div>
<p>
単位はクーロン ($\mathrm{C}$)で、$\mathrm{A \ s}$とも書ける。<br>
${1\ \mathrm{C}}$ は約 $6.2415\times10^{18}$個の電子が持つ電気量。
</p>
<div class="theory-common-box">定義（電流）</div>
<p>
<p>単位はアンペア（${\mathrm{A}}$）で、$\mathrm{C\ s^{-1}}$とも書ける。<br>
電流 ${I}$ は流れる電荷 ${Q}$ の時間微分${\displaystyle I=\frac{dQ}{dt}}$ で定義される。</p>
<p>$1\ \mathrm{A} = 1\ \mathrm{C\ s^{-1}}$は $1$ 秒で約 $ 6.2415\times10^{18}$ 個の電子が流れる量に相当する。</p>
</p>
""",
);
