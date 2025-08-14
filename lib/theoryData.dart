import 'package:joyphysics/model.dart';

final Map<String, List<TheorySubcategory>> theoryData = {
  '力学理論': [
    TheorySubcategory(
      name: '運動方程式',
      topics: [
        TheoryTopic(title: 'ニュートンの運動法則', latexContent: r'$$F = ma$$'),
        TheoryTopic(title: '運動量保存則', latexContent: r'$$\mathbf{p} = m\mathbf{v}$$'),
        TheoryTopic(title: '仕事とエネルギー', latexContent: r'$$W = \Delta E$$'),
      ],
    ),
    TheorySubcategory(
      name: '回転運動',
      topics: [
        TheoryTopic(title: '角運動量', latexContent: r'$$\mathbf{L} = \mathbf{r} \times \mathbf{p}$$'),
        TheoryTopic(title: '回転エネルギー', latexContent: r'$$E_{\mathrm{rot}} = \frac12 I\omega^2$$'),
        TheoryTopic(title: 'トルク', latexContent: r'$$\tau = I\alpha$$'),
      ],
    ),
    TheorySubcategory(
      name: '振動運動',
      topics: [
        TheoryTopic(title: '単振動', latexContent: r'$$x(t) = A\cos(\omega t + \phi)$$'),
        TheoryTopic(title: '減衰振動', latexContent: r'$$x(t) = Ae^{-\gamma t} \cos(\omega t)$$'),
        TheoryTopic(title: '強制振動', latexContent: r'$$m\ddot{x} + c\dot{x} + kx = F_0 \cos(\omega t)$$'),
      ],
    ),
    TheorySubcategory(
      name: '剛体運動',
      topics: [
        TheoryTopic(title: '重心運動', latexContent: r'$$\mathbf{R}_{\text{cm}} = \frac{\sum m_i \mathbf{r}_i}{\sum m_i}$$'),
        TheoryTopic(title: '慣性モーメント', latexContent: r'$$I = \sum m_i r_i^2$$'),
        TheoryTopic(title: '平面運動', latexContent: r'$$v = r\omega$$'),
      ],
    ),
    TheorySubcategory(
      name: '相対性理論入門',
      topics: [
        TheoryTopic(title: '特殊相対論', latexContent: r'$$E = mc^2$$'),
        TheoryTopic(title: '時間の遅れ', latexContent: r'$$t = \frac{t}{\sqrt{1 - v^2/c^2}}$$'),
        TheoryTopic(title: 'ローレンツ変換', latexContent: r'$$x = \gamma(x - vt)$$'),
      ],
    ),
  ],
  '電磁気理論': [
    TheorySubcategory(
      name: '電場と電位',
      topics: [
        TheoryTopic(title: 'クーロンの法則', latexContent: r'$$F = k\frac{q_1 q_2}{r^2}$$'),
        TheoryTopic(title: 'ガウスの法則', latexContent: r'$$\nabla \cdot \mathbf{E} = \frac{\rho}{\varepsilon_0}$$'),
        TheoryTopic(title: '電位差', latexContent: r'$$V = -\int \mathbf{E} \cdot d\mathbf{l}$$'),
      ],
    ),
    TheorySubcategory(
      name: '磁場と電流',
      topics: [
        TheoryTopic(title: 'ビオ・サバールの法則', latexContent: r'$$d\mathbf{B} = \frac{\mu_0}{4\pi} \frac{I\,d\mathbf{l} \times \mathbf{\hat{r}}}{r^2}$$'),
        TheoryTopic(title: 'アンペールの法則', latexContent: r'$$\nabla \times \mathbf{B} = \mu_0 \mathbf{J}$$'),
        TheoryTopic(title: '磁束', latexContent: r'$$\Phi_B = \int \mathbf{B} \cdot d\mathbf{S}$$'),
      ],
    ),
    TheorySubcategory(
      name: '電磁誘導',
      topics: [
        TheoryTopic(title: 'ファラデーの法則', latexContent: r'$$\mathcal{E} = -\frac{d\Phi_B}{dt}$$'),
        TheoryTopic(title: 'レンツの法則', latexContent: r'$$\mathcal{E} \propto -\frac{d\Phi_B}{dt}$$'),
        TheoryTopic(title: '自己インダクタンス', latexContent: r'$$\Phi_B = LI$$'),
      ],
    ),
    TheorySubcategory(
      name: 'マクスウェル方程式',
      topics: [
        TheoryTopic(title: '微分形', latexContent: r'''
          \begin{cases}
          \nabla \cdot \mathbf{E} = \frac{\rho}{\varepsilon_0} \\
          \nabla \cdot \mathbf{B} = 0 \\
          \nabla \times \mathbf{E} = -\frac{\partial \mathbf{B}}{\partial t} \\
          \nabla \times \mathbf{B} = \mu_0 \mathbf{J} + \mu_0 \varepsilon_0 \frac{\partial \mathbf{E}}{\partial t}
          \end{cases}
          '''),
        TheoryTopic(title: '積分形', latexContent: r'''
          \begin{cases}
          \oint \mathbf{E} \cdot d\mathbf{l} = -\frac{d}{dt} \int \mathbf{B} \cdot d\mathbf{S} \\
          \oint \mathbf{B} \cdot d\mathbf{l} = \mu_0 I_{\text{enc}} + \mu_0\varepsilon_0 \frac{d}{dt} \int \mathbf{E} \cdot d\mathbf{S}
          \end{cases}
          '''),
        TheoryTopic(title: '電磁波の波動方程式', latexContent: r'$$\nabla^2 \mathbf{E} - \mu_0\varepsilon_0 \frac{\partial^2 \mathbf{E}}{\partial t^2} = 0$$'),
      ],
    ),
    TheorySubcategory(
      name: '電磁波',
      topics: [
        TheoryTopic(title: '平面波解', latexContent: r'$$\mathbf{E}(z,t) = E_0 \cos(kz - \omega t)$$'),
        TheoryTopic(title: '波の偏光', latexContent: r'$$\mathbf{E}(t) = E_x \cos(\omega t) \hat{\mathbf{x}} + E_y \cos(\omega t + \delta) \hat{\mathbf{y}}$$'),
        TheoryTopic(title: 'エネルギー密度', latexContent: r'$$u = \frac12 (\varepsilon_0 E^2 + \frac{B^2}{\mu_0})$$'),
      ],
    ),
  ],
};