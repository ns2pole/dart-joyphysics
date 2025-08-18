import '../../model.dart';

final uniformAcceleration = TheoryTopic(
  title: '等加速度直線運動',
  latexContent: """
<div class="common-box">命題1（1次元運動の運動方程式）：質量 \\(m\\) の質点に一定の力 \\(F\\) が、直線上に働くとする。このとき運動方程式は
\\[
F = m a
\\]である。</div>
<div class="proof-box">証明</div>
<p>ベクトル方程式 \\(\\vec{F} = m\\vec{a}\\) を1次元に制限すれば、成分により \\(F = ma\\) を得る。\\(\\square\\)</p>


<div class="common-box">命題2（速度の式）：質量 \\(m\\) の質点に一定の加速度 \\(a\\) が働くとき、速度は
\\[
v(t) = v_0 + a t
\\]
である。</div>

<div class="proof-box">証明</div>
\\[
v' = a \\quad \\Rightarrow \\quad
\\int_{0}^{t} v' \\, dt = \\int_{0}^{t} a \\, dt
\\]
\\[
v(t) - v_0 = a t
\\]
ゆえに \\(v(t) = v_0 + at\\)。\\(\\square\\)


<div class="common-box">命題3（位置の式）：質量 \\(m\\) の質点が初期位置 \\(x_0\\)、初速度 \\(v_0\\) で運動を始め、一定の加速度 \\(a\\) を受けるとき、位置は\\[
x(t) = x_0 + v_0 t + \\tfrac{1}{2} a t^2\\]である。</div>



<div class="proof-box">証明</div>
\\[
x' = v \\quad \\Rightarrow \\quad
\\int_{0}^{t} x' \\, dt = \\int_{0}^{t} (v_0 + a t) \\, dt
\\]
\\[
x(t) - x_0 = v_0 t + \\tfrac{1}{2} a t^2
\\]
ゆえに \\(x(t) = x_0 + v_0 t + \\tfrac{1}{2} a t^2\\)。\\(\\square\\)


<div class="common-box">命題4（速度と変位の関係）：質点の速度と変位には次の関係が成り立つ：
\\[
v^2 = v_0^2 + 2 a (x - x_0)
\\]</div>

<div class="proof-box">証明</div>
\\[
v' = a, \\quad x' = v
\\]
より
\\[
v v' = a x' \\quad \\Rightarrow \\quad
\\int_{0}^{t} v v' \\, dt = \\int_{0}^{t} a x' \\, dt
\\]
\\[
\\tfrac{1}{2}(v^2 - v_0^2) = a (x - x_0)
\\]
ゆえに \\(v^2  - v_0^2=  + 2a(x-x_0)\\)。\\(\\square\\)


<div class="common-box">命題5（仕事とエネルギー）：質点に一定の力 \\(F\\) が働くとき、運動エネルギーの変化と力の仕事は一致する：
\\[
\\tfrac12 m v^2 - \\tfrac12 m v_0^2 = F (x - x_0)
\\]</div>

<div class="proof-box">証明</div>
命題4の式に質量 \\(m\\) を掛けて
\\[
\\tfrac{1}{2} m (v^2 - v_0^2) = m a (x - x_0)
\\]
を得る。ここで \\(F=ma\\) を代入すれば
\\[
\\tfrac{1}{2} m v^2 - \\tfrac{1}{2} m v_0^2 = F(x-x_0)
\\]
となる。左辺は運動エネルギーの変化、右辺は力のした仕事である。したがって
\\[
\\Delta E_k = W
\\]
が成り立つ。\\(\\square\\)</p>
""",
);
