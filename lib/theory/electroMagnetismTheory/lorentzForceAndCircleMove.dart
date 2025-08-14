import '../../model.dart';

final lorentzForceAndCircleMove = TheoryTopic(
  title: '一様磁場中の荷電粒子の運動（非相対論、命題・証明形式）',
  latexContent: """
<div class="common-box">記号の定義</div>
<ul>
<li>\\(m\\)：粒子の質量</li>
<li>\\(q\\)：粒子の電荷</li>
<li>\\(\\overrightarrow{v}=(v_x,v_y,v_z)\\)：速度ベクトル</li>
<li>\\(\\overrightarrow{B}=(0,0,B)\\)：一様磁場</li>
<li>\\(\\omega_c = \\frac{qB}{m}\\)：サイクロトロン周波数</li>
<li>\\(v_\\parallel = v_z\\)：磁場方向速度成分</li>
<li>\\(v_\\perp = \\sqrt{v_x^2+v_y^2}\\)：磁場に直交する速度成分</li>
<li>\\(R = v_\\perp / |\\omega_c|\\)：円運動の半径</li>
<li>\\(p = 2\\pi v_\\parallel / |\\omega_c|\\)：螺旋運動のピッチ</li>
</ul>

<div class="common-box">命題・証明</div>

\\begin{prop}[運動方程式]
荷電粒子は一様磁場中で、ローレンツ力によって運動する。
\\end{prop}
\\begin{proof}
運動方程式は
\\[
m \\frac{d\\overrightarrow{v}}{dt} = q \\, \\overrightarrow{v} \\times \\overrightarrow{B}
\\]
で与えられる。
\\end{proof}

\\begin{prop}[磁場方向の速度]
磁場方向の速度成分 \$v_\\parallel\$ は一定である。
\\end{prop}
\\begin{proof}
磁場方向を \$z\$ 軸とすると、ローレンツ力の \$z\$ 成分は
\\[
m \\dot v_z = q(v_x B_y - v_y B_x) = 0
\\]
したがって \$v_z = v_\\parallel\$ は時間に依存せず一定である。
\\end{proof}

\\begin{prop}[磁場に直交する速度]
磁場に直交する速度成分 \$(v_x,v_y)\$ は等速円運動を行う。
\\end{prop}
\\begin{proof}
運動方程式の \$x\$、\$y\$ 成分は
\\[
\\dot v_x = \\omega_c v_y, \\quad \\dot v_y = -\\omega_c v_x
\\]
である。これを微分して
\\[
\\ddot v_x = -\\omega_c^2 v_x
\\]
となり、単振動の方程式である。初期条件 \$v_x(0)=v_{x0}, v_y(0)=v_{y0}\$ から
\\[
v_x(t) = v_{x0} \\cos(\\omega_c t) + v_{y0} \\sin(\\omega_c t), \\quad
v_y(t) = -v_{x0} \\sin(\\omega_c t) + v_{y0} \\cos(\\omega_c t)
\\]
となる。これにより、直交平面内で半径 \$R=v_\\perp/|\\omega_c|\$ の円運動を行うことがわかる。
\\end{proof}

\\begin{prop}[螺旋運動]
磁場方向の直線運動と直交面内の円運動の合成として、粒子は螺旋運動をする。
\\end{prop}
\\begin{proof}
磁場方向に \$v_\\parallel\$ の等速直線運動、直交面に半径 \$R\$ の円運動を組み合わせると、
\\[
\\overrightarrow{r}(t) =
\\begin{pmatrix}
R \\cos(\\omega_c t + \\phi) \\\\
R \\sin(\\omega_c t + \\phi) \\\\
v_\\parallel t + z_0
\\end{pmatrix}
\\]
となる。ピッチは \$p = 2\\pi v_\\parallel / |\\omega_c|\$。
\\end{proof}
"""
);
