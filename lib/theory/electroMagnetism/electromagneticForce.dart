import '../../model.dart';

final electromagneticForce = TheoryTopic(
  title: 'クーロン力とローレンツ力',
  imageAsscet: 'assets/mindMap/forTopics/electromagneticForce.png',
  latexContent: r"""
<div class="theory-common-box">法則（荷電粒子が受ける力）</div>
<p>
荷電粒子が電場 $\vec{E}$ および磁場 $\vec{B}$ の中を速度 $\vec{v}$ で運動するとき，
この電磁場から受ける力は次式で与えられる。
</p>

$$
\vec{F} = q \bigl( \vec{E} + \vec{v} \times \vec{B} \bigr)
$$

<div class="paragraph-box">説明</div>
<ul>
  <li>$q \vec{E}$ は電場による力で <b>クーロン力</b> という。</li>
  <li>$q \vec{v} \times \vec{B}$ は磁場による力で <b>ローレンツ力</b> という。(電場による力(クーロン力)もまとめてローレンツ力と呼ぶこともある。)<br>
      （「$\times$」はベクトルの <b>クロス積</b> を表し、方向は右ねじの法則で決まる。）</li>
</ul>

<div class="paragraph-box">補足</div>
<ul>
  <li>磁場の力は常に $\vec{v}$ に直交するため，仕事をしない（速度の大きさは変えない）。</li>
  <li>力の見え方は観測者に依存する。<br>
    ある観測者には「静止電荷に働くクーロン力」と見えても，
    別の観測者には「運動する電荷に働くローレンツ力」として表される。<br>
  <li>同様に、観測者の慣性系によって電場と磁場は違って見える。<br>
    例えば，ある観測者にとって純粋な磁場でも，別の観測者にとっては電場と磁場の両方として現れる。ちなみに、相対論的では電場と磁場は統一的に「電磁場テンソル」として扱う。
  </li>
</li>
""",
);
