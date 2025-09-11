import '../../model.dart';

final permittivityAndPermeabilityTable = TheoryTopic(
  title: '電場磁場の分極対応表',
  latexContent: r"""
<style>
  table.material-table {
  table-layout: fixed;
  border-collapse: collapse;
  box-sizing: border-box;
  margin: 0 auto;        /* 中央寄せ */
  max-width: 800px;
  width: 100%;
}

table.material-table th,
table.material-table td {
  box-sizing: border-box;
  width: 50%;               /* 等間隔に固定 */
  text-align: center;
  vertical-align: middle;
  padding: 4px 6px;
  border: 1px solid #d0d0d0;   /* 通常の線 */
  font-size: 0.92em;
  line-height: 1.15;
  word-wrap: break-word;
  white-space: pre-wrap;
}

table.material-table th {
  background: #f7f7f7;
  font-weight: 600;
}

/* 真ん中の縦線だけ太くする */
table.material-table td + td,
table.material-table th + th {
  border-left: 1px solid #606060;  /* ←中央縦線を太く＆濃く */
}

.item-title {
  font-weight: 600;
  display: block;
  margin-bottom: 0px;
  font-size: 0.95em;
}
.formula {
  display: block;
  margin-bottom: 0px;
}
.explain {
  margin-top: 10px;
  font-size: 0.92em;
  text-align: left;
}
.explain ul {
  margin: 6px 0 8px 18px;
  padding: 0;
}
.explain li {
  margin-bottom: 4px;
}

</style>


<table class="material-table" cellspacing="0" cellpadding="4">
  <tr>
    <th>電場側（項目・式）</th>
    <th>磁場側（項目・式）</th>
  </tr>

  <tr>
    <td>
      <span class="item-title">分極と電気感受率 (χ<sub>e</sub>)</span>
      <span class="formula">\(\displaystyle \vec{P}=\chi_{e}\,\varepsilon_{0}\,\vec{E}\)</span>
    </td>
    <td>
      <span class="item-title">磁気分極と磁化率 (χ<sub>m</sub>)</span>
      <span class="formula">\(\displaystyle \vec{P}_{m}=\vec{B}-\mu_{0}\vec{H}=\mu_{0}\vec{M}\)</span>
    </td>
  </tr>

  <tr>
    <td>
      <span class="item-title">誘電率 (ε)</span>
      <span class="formula">\(\displaystyle \vec{D}=\varepsilon\,\vec{E}\)</span>
      <span class="formula">\(\displaystyle \varepsilon=\varepsilon_{0}\,(1+\chi_{e})\)</span>
    </td>
    <td>
      <span class="item-title">透磁率 (μ)</span>
      <span class="formula">\(\displaystyle \vec{B}=\mu\,\vec{H}\)</span>
      <span class="formula">\(\displaystyle \mu=\mu_{0}\,(1+\chi_{m})\)</span>
    </td>
  </tr>

  <tr>
    <td>
      <span class="item-title">比誘電率 (ε<sub>r</sub>)</span>
      <span class="formula">\(\displaystyle \varepsilon_{r}=\dfrac{\varepsilon}{\varepsilon_{0}}=1+\chi_{e}\)</span>
    </td>
    <td>
      <span class="item-title">比透磁率 (μ<sub>r</sub>)</span>
      <span class="formula">\(\displaystyle \mu_{r}=\dfrac{\mu}{\mu_{0}}=1+\chi_{m}\)</span>
    </td>
  </tr>

  <tr>
    <td>
      <span class="item-title">真空の誘電率 (ε<sub>0</sub>)</span>
      <span class="formula">約\(\displaystyle  8.85\times10^{-12}\ \mathrm{F/m}\)</span>
    </td>
    <td>
      <span class="item-title">真空の透磁率 (μ<sub>0</sub>)</span>
      <span class="formula">約\(\displaystyle  1.26\times10^{-6}\ \mathrm{H/m}\)</span>
    </td>
  </tr>

  <tr>
    <td colspan="2">
      <span class="item-title">真空中の光速 (c)</span>
      <span class="formula">\(\displaystyle c=\dfrac{1}{\sqrt{\varepsilon_{0}\mu_{0}}}\fallingdotseq 2.99\times10^{8}\ \mathrm{m/s}\)</span>
      <span class="br"></span>
      <span class="item-title">媒質中の光速（位相速度）</span>
      <span class="formula">\(\displaystyle v=\dfrac{1}{\sqrt{\varepsilon\mu}}=\dfrac{c}{\sqrt{\varepsilon_{r}\mu_{r}}}\)</span>
    </td>
  </tr>
</table>

<div class="explain">
  <h4>説明（箇条書き）</h4>
  <ul>
    <li>\(\vec{P}\)：単位体積あたりの電気双極子モーメント密度（分極）。線形媒質では \(\vec{P}=\chi_{e}\varepsilon_{0}\vec{E}\)</li>
    <li>\(\chi_{e}\)：電気感受率（無次元）。\(\varepsilon=\varepsilon_{0}(1+\chi_{e})\) により誘電率と結びつく。</li>
    <li>\(\varepsilon\)：誘電率（F/m）。電束密度は \(\vec{D}=\varepsilon\vec{E}\)</li>
    <li>\(\varepsilon_{r}=\displaystyle \frac{\varepsilon}{\varepsilon_{0}}\)：比誘電率（無次元）</li>
    <li>\(\vec{P}_{m}\)：磁気分極。定義は \(\vec{P}_{m}=\vec{B}-\mu_{0}\vec{H}=\mu_{0}\vec{M}\)</li>
    <li>\(\chi_{m}\)：磁化率（無次元）。線形媒質では \(\vec{M}=\chi_{m}\vec{H}\)</li>
    <li>\(\mu\)：透磁率（H/m）。磁束密度は \(\vec{B}=\mu\vec{H}\)</li>
    <li>\(\mu_{r}=でぃs\displaystyle \frac{\mu}{\mu_{0}}\)：比透磁率（無次元）</li>
    <li>光速は真空定数 \(\varepsilon_{0},\mu_{0}\) から決まる：\(c=\displaystyle\displaystyle \frac {1}{\sqrt{\varepsilon_{0}\mu_{0}}}\)</li>
    <li>媒質中の位相速度は \(v=\displaystyle\displaystyle \frac{1}{\sqrt{\varepsilon\mu}}=\displaystyle \frac{c}{\sqrt{\varepsilon_{r}\mu_{r}}}\)（線形・等方媒質の場合）</li>
    <li>注：ここでは線形・等方媒質を仮定している。実際には分散・損失・異方性・非線形性がある。</li>
  </ul>
</div>

""",
);
