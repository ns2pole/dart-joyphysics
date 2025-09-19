import '../../model.dart';

final permittivity = TheoryTopic(
  title: '分極, 電気感受率, 誘電率, 比誘電率',
  imageAsscet: 'assets/mindMap/forTopics/permittivity.png',

  latexContent: r"""

<div class="theory-common-box">定義（真空の誘電率：$\varepsilon_0$）</div>
<p>
真空の誘電率は電磁定数の一つで、SI単位系における値は近似的に
$$
\displaystyle \varepsilon_0 \fallingdotseq 8.854\,187\,817\times 10^{-12}\ \mathrm{F/m}
$$
である。
</p>


<div class="theory-common-box">定義（電気双極子）</div>
<p>
2つの大きさが等しく符号が反対の点電荷 $+q$, $-q$ が分離ベクトル $\vec d$ だけ隔てられて存在するとき、
その組を電気双極子という。慣習として分離ベクトル $\vec d$ は負電荷から正電荷へ向かう向きに取り、
電気双極子モーメント $\vec p$ は
$$
\vec p = q \vec d
$$
で定義される（単位は $C\cdot m$ ）。
</p>

<div class="theory-common-box">定義（分極）</div>
<p>
外部から電場を加えると，誘電体中の分子や原子において，電子雲が核に対してわずかに変位し，
正電荷と負電荷の重心がずれる。この現象を分極という。（分極の結果，誘電体の各分子や原子には電気双極子が誘起される。）
</p>

<div class="theory-common-box">定義（分極ベクトル）</div>
<p>
誘電体に電場を掛けると、誘電体中の構成分子が分極を起こし、電気双極子が発生する。そこで、単位体積あたりの電気双極子モーメントを分極ベクトルという。
</p>


<div class="theory-common-box">定義（電気感受率：$\chi_e\ $）</div>
<p>
誘電体にかけた電場に応じて線形に分極ベクトルが生じる時、分極ベクトルは下記のように表すことができる。
$$
\displaystyle \vec P = \chi_e\,\varepsilon_0\,\vec E
$$
ここで $\chi_e$ は電気感受率といい、媒質中の双極子応答の強さを表す。
</p>

<div class="theory-common-box">定義（電束密度）</div>
電束密度 $\vec D$ を電場と分極ベクトル $\vec P$ を用いて下記で定義する。
$$
\vec D = \varepsilon_0 \vec E + \vec P
$$


<div class="theory-common-box">命題（真空中の電束密度）：
真空では電束密度と電場の関係は下記の通り。
$$
\vec D = \varepsilon_0 \vec E
$$  
</div>
<div class="proof-box">証明</div>
真空では分極が起きないので、$\vec P = \vec 0\ $となり直ちに得られる。 Q.E.D
</p>

<div class="theory-common-box">定義（誘電率：$\varepsilon$）</div>
<p>
電束密度の定義$\vec D=\varepsilon_0\vec E+\vec P$ と電気感受率の式$\vec P = \chi_e \varepsilon_0 \vec E$を合わせると、線形等方媒質では
$$\begin{aligned}
\vec D &= \varepsilon_0\vec E+\vec P\\[6pt]
 &=\varepsilon_0\vec E + \chi_e\,\varepsilon_0\,\vec E\\[6pt]
&= \varepsilon \vec E \quad ;\ \varepsilon=\varepsilon_0(1+\chi_e)
\end{aligned}$$
が得られる。この$\varepsilon$を媒質の誘電率という。単位はファラド毎メートル（$\mathrm{F/m}$）。
</p>

<div class="theory-common-box">定義（比誘電率：$\varepsilon_r$）</div>
<p>
$$
\displaystyle \varepsilon_r \equiv \frac{\varepsilon}{\varepsilon_0} = 1+\chi_e
$$
を比誘電率という。真空では $\varepsilon_r=1$ である。
</p>


<div class="theory-common-box">命題（線形媒質中の電場$\vec E$）：線形媒質の時、上の透磁率、比透磁率の定義を用いると磁束密度$\vec B$は、磁場の強さ$\vec H$を用いて下記のように表すことが出来る。
$$
\displaystyle \vec D = \varepsilon_r \varepsilon_0 \vec E
$$
</div>
<p><div class="proof-box">証明</div>
線形媒質の場合、$\vec D = \varepsilon \vec E\ $であるが、比透磁率の定義より、$\varepsilon = \varepsilon_r \varepsilon_0\  $なので、
$\displaystyle \vec D = \varepsilon \vec E = \varepsilon_r \varepsilon_0 \vec E\ $となる。　Q.E.D
</p>

""",
);
