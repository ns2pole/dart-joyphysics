import '../../model.dart';

final infiniteStraightCurrentHFieldNoFlux = TheoryTopic(
  title: '無限に長い直線電流の磁場強度 \\(\\overrightarrow{H}\\)（真空中・積分形のみで導出）',
  latexContent: """
<div class="condition-box">条件と記号</div>
<ul>
  <li>空間は真空</li>
  <li>\$z\$軸方向に、無限に長い直線電流 \$I[A]\$ が \$r=0\$ に集中して流れている（系は \$z\$ 軸まわりの回転対称かつ\$z\$方向に並進対称）</li>
  <li>変位電流は存在しない</li>
  <li>\$z\$方向の単位ベクトルを \$\\hat{\\mathbf z}\$と表す。</li>
  <li>動径方向の単位ベクトルを \$\\hat{\\mathbf r}\$と表す。</li>
  <li>角度方向の単位ベクトルを \$\\hat{\\boldsymbol\\phi}\$と表す。</li>
  <li>この時生成される磁場を\$ \\overrightarrow H=H_r(r,\\phi,z)\\,\\hat{\\mathbf r}+H_\\phi(r,\\phi,z)\\,\\hat{\\boldsymbol\\phi}+H_z(r,\\phi,z)\\,\\hat{\\mathbf z} \$とする</li>
</ul>
<div class="theorem-box">
定理：上記の条件と記号のもとで、\$\\overrightarrow H = \\displaystyle \\frac{I}{2\\pi r} \\, \\hat{\\boldsymbol\\phi}\$が成り立つ。
</div>
この定理を命題1〜命題6を示し、用いる事で証明する。
<br><br>
<div class="common-box">命題1：磁場は\$\\displaystyle
  \\overrightarrow H=H_r(r)\\,\\hat{\\mathbf r}+H_\\phi(r)\\,\\hat{\\boldsymbol\\phi}+H_z(r)\\,\\hat{\\mathbf z}
\$と表される。</div>
<div class="proof-box">証明</div>
一般に磁場(ベクトル場)を
\$\\displaystyle
  \\overrightarrow H=H_r(r,\\phi,z)\\,\\hat{\\mathbf r}+H_\\phi(r,\\phi,z)\\,\\hat{\\boldsymbol\\phi}+H_z(r,\\phi,z)\\,\\hat{\\mathbf z}
\$
と表す。系は \$z\$ 軸まわりの回転対称かつ\$z\$方向に並進対称であるから、任意の点での場は\$\\phi\$と\$z\$に依存しない。すなわち、各成分は半径 r のみの関数となり、
\$\\displaystyle
  \\overrightarrow H=H_r(r)\\,\\hat{\\mathbf r}+H_\\phi(r)\\,\\hat{\\boldsymbol\\phi}+H_z(r)\\,\\hat{\\mathbf z}
\$
が成り立つ。 \$\\square\$


<div class="common-box">命題2：磁場の\$z\$方向成分\$H_z(r)\$は場所によらず一定</div>
<div class="proof-box">証明</div>
\$r=r_1\$ と \$r=r_2\$ にある二本の直線を垂直辺とする長方形ループ（\$r-z\$平面内）について、
\$\\displaystyle \\oint_C \\overrightarrow H \\cdot d\\overrightarrow l = \\displaystyle H_z(r_1)L - H_z(r_2)L\$
となる。
ループは電流を囲まないのでアンペールの法則の積分形より、
\\begin{aligned}
\\displaystyle
\\oint_C \\overrightarrow H \\cdot d\\overrightarrow{l} &= 0 \\\\[5pt]
\\Leftrightarrow H_z(r_1) - H_z(r_2) &= 0 \\\\[5pt] 
\\Leftrightarrow H_z(r_1) &= H_z(r_2)
\\end{aligned}
\$r_1,r_2\$は任意なので\$ H_z(r)\$ は定数。 \$\\square\$


<div class="common-box">命題3：半径\$r\$,高さ\$L\$の同心円柱を閉曲面とすると、\$\\displaystyle \\oint_S \\overrightarrow H \\cdot d\\overrightarrow S = 2\\pi r L \\times H_r(r)\$ が成り立つ。</div>
<div class="proof-box">証明</div>
命題2より\$H_z(r)=H_{z0}\$(定数)とおいて、円柱の閉曲面について、上下面と側面の面積分を計算する。<br>
[1] 下面: 下面を貫く磁場は\$z\$方向成分のみを考えれば良い。下面を貫く流出量は、符合に注意して、\$\\displaystyle \\int_{S_{under}} \\overrightarrow H \\cdot d\\overrightarrow S = - S H_{z0}\$<br>
[2] 上面:上面を貫く磁場はz方向成分のみを考えれば良い。上面を貫く流出量は、符合に注意して \$\\displaystyle \\int_{S_{over}} \\overrightarrow H \\cdot d\\overrightarrow S = S H_{z0}\$<br>
[3] 側面: 側面における面積分の値は、r 成分のみが効くので、側面積と Hr(r) の積となる。すなわち
\$\\displaystyle \\int_{S_{side}} \\overrightarrow H \\cdot d\\overrightarrow S = 2\\pi r L \\times H_r(r)\$<br>
これらを合計すると、
\\begin{aligned}
\\displaystyle
  \\oint_S \\overrightarrow H \\cdot d\\overrightarrow S &= -S H_{z0} + S H_{z0} + 2\\pi r L \\times H_r(r) \\\\ &= 2\\pi r L \\times H_r(r)
\\end{aligned}
 \$\\square\$

<div class="common-box">命題4：任意の\$r\$について、磁場の動径方向成分について\$H_r(r)=0が成り立つ。\$</div>
<div class="proof-box">証明</div>
磁場のガウスの法則より \$\\displaystyle \\oint_S \\overrightarrow H \\cdot d\\overrightarrow S = 0\$。<br>
命題3より
\$\\displaystyle
  2\\pi r L \\times H_r(r) = 0 \\Leftrightarrow H_r(r) = 0
\$ \$\\square\$

<div class="common-box">命題5：磁場の角度方向成分について、\$ \\displaystyle H_\\phi(r) = \\frac{I} {2\\pi r} \$が成り立つ。</div>
<div class="proof-box">証明</div>
半径\$r\$の同心円周について、磁場の線積分の値は
\$\\displaystyle
  \\oint_C \\overrightarrow H \\cdot d\\overrightarrow l = H_\\phi(r) \\times 2\\pi r
\$
なので、アンペールの法則より
\$\\displaystyle
  H_\\phi(r) \\times 2\\pi r = I \\Leftrightarrow H_\\phi(r) = \\displaystyle \\frac{I}{2\\pi r}
\$. \$\\square\$

<div class="common-box">命題6：磁場は  \$\\overrightarrow H = \\displaystyle \\frac{I}{2\\pi r} \\, \\hat{\\boldsymbol\\phi} + H_{z0} \\, \\hat{\\mathbf z}\$
と表すことができる。 （ただし、\$H_{z0}\$は位置によらない定数）</div>
<div class="proof-box">証明</div>
命題2より \$H_z=H_{z0}\$（定数）、命題4より \$H_r=0\$、命題5より \$H_{\\phi}=\\displaystyle \\frac{I}{2\\pi r}\$。<br>
命題1の形を用いてまとめると
\$\\displaystyle
  \\overrightarrow H = H_r(r)\\,\\hat{\\mathbf r}+H_\\phi(r)\\,\\hat{\\boldsymbol\\phi}+H_z(r)\\,\\hat{\\mathbf z} = \\displaystyle \\frac{I}{2\\pi r} \\, \\hat{\\boldsymbol\\phi} + H_{z0} \\, \\hat{\\mathbf z}
\$. \$\\square\$

<div class="theorem-box">定理：\$\\overrightarrow H = \\displaystyle \\frac{I}{2\\pi r} \\, \\hat{\\boldsymbol\\phi}\$が成り立つ。</div>
<div class="proof-box">証明</div>
命題6より、\$H_{z0} = 0\$ を示せば良い。<br>
無限遠方で磁場が 0 に収束する境界条件を課すと
\\begin{aligned}
   & \\lim_{r\\to\\infty}|\\overrightarrow H| = 0 \\\\[6pt]
  \\Leftrightarrow & \\lim_{r\\to\\infty} \\sqrt{\\overrightarrow H \\cdot \\overrightarrow H} = 0 \\\\[6pt]
  \\Leftrightarrow &\\lim_{r\\to\\infty} \\sqrt{\\Bigl(\\displaystyle \\frac{I}{2\\pi r} \\, \\hat{\\boldsymbol\\phi} + H_{z0} \\, \\hat{\\mathbf z} \\Bigr) \\cdot \\Bigl(\\displaystyle \\frac{I}{2\\pi r} \\, \\hat{\\boldsymbol\\phi} + H_{z0} \\, \\hat{\\mathbf z} \\Bigr)} = 0 \\\\[6pt]
  \\Leftrightarrow &\\lim_{r\\to\\infty} \\sqrt{\\Bigl(\\displaystyle \\frac{I}{2\\pi r} \\Bigr)^2 + H_{z0}^2} = 0 \\\\[6pt]
  \\Leftrightarrow & \\sqrt{ H_{z0}^2} = 0 \\\\[6pt]
  \\Leftrightarrow &|H_{z0}| = 0 \\\\[6pt]
  \\Leftrightarrow &H_{z0} = 0 \\\\[6pt]
\\end{aligned}
\$\\square\$
"""
);
