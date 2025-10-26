import '../../model.dart';

final mutualInductanceDerivation = TheoryTopic(
  title: '同軸ソレノイドの相互インダクタンスの導出（長ソレノイド近似）',
  // imageAsset: 'assets/mindMap/forTopics/mutualInductance.png',
  latexContent: r"""
<div class="theory-common-box">記号（すべて冒頭に定義）</div>
\[
\begin{aligned}
a & = \text{内側ソレノイドの半径} \\
b & = \text{外側ソレノイドの半径} \\
\ell & = \text{両ソレノイドの共有長さ} \\
n_1 & = \text{内側の巻数密度（回/ｍ）} \\
n_2 & = \text{外側の巻数密度（回/ｍ）} \\
N_1 & = n_1\,\ell \\
N_2 & = n_2\,\ell \\
\mu_0 & = 4\pi\times10^{-7}\ \mathrm{H/m} \\
A_{\min} & = \pi\,[\min(a,b)]^2 \\
A_{\text{in}} & = \pi a^2 \\
A_{\text{out}} & = \pi b^2 \\
I_1 & = \text{内側を流す電流} \\
I_2 & = \text{外側を流す電流} \\
B & = \text{ソレノイド内の磁束密度（長ソレノイド近似）} \\
\Phi_1 & = \text{内側の1ターン当たり磁束} \\
\Phi_2 & = \text{外側の1ターン当たり磁束} \\
\Lambda_1 & = \text{内側の鎖交磁束 } \\
\Lambda_2 & = \text{外側の鎖交磁束 } \\
M & = \text{相互インダクタンス}
\end{aligned}
\]

<div class="theory-common-box">定義（日本語で丁寧に）</div>
<p>
相互インダクタンス \(M\) は、<b>一方の回路の電流</b>が作る磁束が<b>他方の回路の巻線に鎖交</b>する効果を
「電流 → 鎖交磁束」の比例係数として表した量です。すなわち、
「内側に電流 \(I_1\) を流したとき外側が受ける鎖交磁束 \(\Lambda_2\)」の比（または逆）で定義します。
</p>

\[
\begin{aligned}
M & = \dfrac{\Lambda_2}{I_1} \\
  & = \dfrac{\text{外側の鎖交磁束}}{\text{内側の電流}} \\[6pt]
M & = \dfrac{\Lambda_1}{I_2} \\
  & = \dfrac{\text{内側の鎖交磁束}}{\text{外側の電流}}
\end{aligned}
\]
<p>
この定義は、どちら側から見ても同じ \(M\) を与えます（<b>相反性</b>）。
</p>

<div class="theory-common-box">線形性と相反性（マクスウェル方程式との関係）</div>
<p>
真空や線形媒質（透磁率が一定）では、電磁場の方程式は<b>線形</b>です。
そのため、電流に対して磁束密度 \(B\) は比例し（重ね合わせが可能）、
巻線に鎖交する磁束 \(\Lambda\) も電流に比例します。結果として
「\(\Lambda\) は \(I\) に比例」という一次関係が成り立ち、比例係数が
自己インダクタンス \(L\) や相互インダクタンス \(M\) になります。
線形性とエネルギーの対称性から、<b>\(M\) は交換可能</b>（相反的）で、
\(\Lambda_2/I_1\) と \(\Lambda_1/I_2\) が一致します。
</p>

<div class="theory-common-box">前提（長ソレノイド近似の要点）</div>
\[
\begin{aligned}
B & = \mu_0\,n\,I
\end{aligned}
\]
<p>
内部の磁場は一様、外部はほぼ 0 と近似します。重なる領域の実効断面は内外の小さい方：
</p>
\[
\begin{aligned}
A_{\min} & = \pi\,[\min(a,b)]^2
\end{aligned}
\]

<div class="theory-common-box">導出（内側に電流 \(I_1\) を流す）</div>
\[
\begin{aligned}
B_1 & = \mu_0\,n_1\,I_1 \\
\Phi_{2,\text{per turn}} & = B_1\,A_{\min} \\
\Lambda_2 & = N_2\,\Phi_{2,\text{per turn}} \\
          & = (n_2\,\ell)\,(\mu_0\,n_1\,I_1\,A_{\min}) \\
M & = \dfrac{\Lambda_2}{I_1} \\
  & = \mu_0\,n_1\,n_2\,A_{\min}\,\ell
\end{aligned}
\]

<div class="theory-common-box">導出（外側に電流 \(I_2\) を流す：相反性の確認）</div>
\[
\begin{aligned}
B_2 & = \mu_0\,n_2\,I_2 \\
\Phi_{1,\text{per turn}} & = B_2\,A_{\min} \\
\Lambda_1 & = N_1\,\Phi_{1,\text{per turn}} \\
          & = (n_1\,\ell)\,(\mu_0\,n_2\,I_2\,A_{\min}) \\
\dfrac{\Lambda_1}{I_2} & = \mu_0\,n_1\,n_2\,A_{\min}\,\ell \\
M & = \mu_0\,n_1\,n_2\,A_{\min}\,\ell
\end{aligned}
\]

<div class="theory-common-box">まとめ（単位長さ当たりの形）</div>
\[
\begin{aligned}
\dfrac{M}{\ell} & = \mu_0\,n_1\,n_2\,A_{\min}
\end{aligned}
\]
\[
\begin{aligned}
\text{内側が完全に外側に含まれるとき} & : A_{\min} = A_{\text{in}} \\
\text{外側が内側より小さいとき} & : A_{\min} = A_{\text{out}}
\end{aligned}
\]

<div class="theory-common-box">注意（近似の範囲）</div>
<ul>
  <li>長ソレノイド近似：\(\ell \gg a,\,b\)。端効果や漏れ磁束は無視。</li>
  <li>巻きは密で一様と仮定。積層の隙間やピッチのムラは考えない。</li>
  <li>磁性体コアがある場合は \(\mu_0\) を \(\mu=\mu_0\mu_r\) に置換。</li>
  <li>非線形材（\(\mu\) が場に依存）や強い結合では
      線形近似・相反性が破れる場合があるため注意。</li>
</ul>
"""
);
