import '../../model.dart';

final electricDipole = TheoryTopic(
  title: '電気双極子',
  latexContent: r"""
<div class="theory-common-box">定義（電気双極子モーメント）</div>
<p>
電荷 +q と -q が近接して存在する系を <b>電気双極子</b> と呼ぶ。その大きさと向きを表すベクトルを <b>電気双極子モーメント</b> \(\vec p\) といい、
\[
\vec p = q \vec d
\]
で定義される。ここで \(\vec d\) は正電荷から負電荷へのベクトルである。
</p>

<div class="theory-common-box">命題：電気双極子が作る電場</div>
<p>
原点に電気双極子モーメント \(\vec p\) があるとき、位置 \(\vec r\) における電場は
\[
\vec E(\vec r) = \frac{1}{4\pi \varepsilon_0 r^3} \Bigl( 3(\vec p\cdot\hat r)\hat r - \vec p \Bigr)
\]
ただし \(\displaystyle r=|\vec r|,\ \hat r=\frac{\vec r}{r}\) である。
</p>

<div class="paragraph-box">証明</div>
<p>
2つの電荷 +q, -q が位置 \(\pm \tfrac{1}{2} \vec d\) に存在する場合、電場は
\[
\vec E(\vec r) = \frac{1}{4\pi\varepsilon_0} q \Bigl( \frac{\vec r-\tfrac{1}{2}\vec d}{|\vec r-\tfrac{1}{2}\vec d|^3} - \frac{\vec r+\tfrac{1}{2}\vec d}{|\vec r+\tfrac{1}{2}\vec d|^3} \Bigr)
\]
で与えられる。遠方 \(|\vec r| \gg |\vec d|\) ではテイラー展開を行い、第一非自明な寄与のみ残す計算を行うが、これは磁気双極子の項と全く同じ証明なので<a href="app://openTopic?topic=magnetic">こちらの記事の命題2,3</a>を参考されたい。
</p>

</p>

<div class="theory-common-box">命題(外部電場中でのトルク)：電気双極子 \(\vec p\) が一様外部電場 \(\vec E\) 中に置かれると、トルク \(\vec{\tau}\) 下記となる。
\[
\vec{\tau} = \vec p \times \vec E
\]
</p>

<div class="paragraph-box">証明</div>
<p>
正電荷 +q と負電荷 -q に働く力はそれぞれ \(\vec F_+ = q\vec E, \vec F_- = -q\vec E\) である。電荷間ベクトルを \(\vec d\) とすると、
\[
\vec{\tau} = \frac{1}{2}\vec d \times q\vec E + \left(-\frac{1}{2}\vec d\right) \times (-q\vec E) = \vec p \times \vec E
\]
　Q.E.D
</p>

""",
);



// <div class="theory-common-box">命題：複数電荷分布の双極子近似</div>
// <p>
// 総電荷がゼロの有限電荷分布 \(\{q_i,\vec r_i\}\) に対して、遠方では電場は双極子近似で
// \[
// \vec p = \sum_i q_i \vec r_i
// \]
// により表される。
// </p>

// <div class="paragraph-box">証明</div>
// <p>
// 電場の重ね合わせ原理により、遠方の観測点 \(|\vec r| \gg |\vec r_i|\) における電場は
// \[
// \vec E(\vec r) = \frac{1}{4\pi\varepsilon_0} \sum_i q_i \frac{\vec r - \vec r_i}{|\vec r - \vec r_i|^3}
// \]
// である。多項展開を行い0次項（総電荷）がゼロで消えると、一次項が双極子場となる。
// </p>



// <div class="theory-common-box">命題：遠方での電場は双極子場に一致する</div>
// <p>
// 有限の電荷分布の電場は、観測点が十分遠い場合、双極子場に近似できる。
// </p>

// <div class="paragraph-box">証明（ベクトルポテンシャルによるスケッチ）</div>
// <p>
// 静電ポテンシャルは
// \[
// \phi(\vec r) = \frac{1}{4\pi\varepsilon_0} \sum_i \frac{q_i}{|\vec r - \vec r_i|}
// \]
// で与えられる。遠方では
// \[
// \frac{1}{|\vec r - \vec r_i|} = \frac{1}{r} + \frac{\hat r \cdot \vec r_i}{r^2} + O(|\vec r_i|^2/r^3)
// \]
// と展開可能。総電荷がゼロなら 0 次項は消え、1 次項が双極子場となる。
// </p>