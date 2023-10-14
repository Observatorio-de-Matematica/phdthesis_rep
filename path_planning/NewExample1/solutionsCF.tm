<TeXmacs|1.99.12>

<style|<tuple|generic|macaulay2>>

<\body>
  <\session|macaulay2|default>
    <\output>
      <\errput>
        Macaulay2, version 1.12

        with packages: ConwayPolynomials, Elimination, IntegralClosure,
        InverseSystems,

        \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ LLLBases,
        PrimaryDecomposition, ReesAlgebra, TangentCone
      </errput>
    </output>

    <\unfolded-io>
      i32 :\ 
    <|unfolded-io>
      restart;
    <|unfolded-io>
      <\errput>
        Macaulay2 restarting...

        \;

        Macaulay2, version 1.12

        with packages: ConwayPolynomials, Elimination, IntegralClosure,
        InverseSystems,

        \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ LLLBases,
        PrimaryDecomposition, ReesAlgebra, TangentCone
      </errput>
    </unfolded-io>

    <\unfolded-io>
      i1 :\ 
    <|unfolded-io>
      R = QQ[x_1,x_2]
    <|unfolded-io>
      <html-text|<math|<tabular|<tformat|<cwith|1|-1|1|1|cell-halign|r>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|3|3|cell-halign|l>|<table|<row|<cell|<with|color|red|o1>>|<cell|<with|color|red|=>>|<cell|R>>|<row|<cell|>|<cell|>|<cell|>>|<row|<cell|<with|color|red|o1>>|<cell|<with|color|red|:>>|<cell|PolynomialRing>>>>>>>
    </unfolded-io>

    <\input>
      i2 :\ 
    <|input>
      p = (x_1-1)^2+x_2^2-1/4;
    </input>

    <\input>
      i3 :\ 
    <|input>
      M = image diff(matrix{{x_1,x_2}},p);
    </input>

    <\unfolded-io>
      i4 :\ 
    <|unfolded-io>
      J = quotient(M,p)
    <|unfolded-io>
      <html-text|<math|<tabular|<tformat|<cwith|1|-1|1|1|cell-halign|r>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|3|3|cell-halign|l>|<table|<row|<cell|<with|color|red|o4>>|<cell|<with|color|red|=>>|<cell|J>>|<row|<cell|>|<cell|>|<cell|>>|<row|<cell|<with|color|red|o4>>|<cell|<with|color|red|:>>|<cell|Module>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      i5 :\ 
    <|unfolded-io>
      G = gens gb J
    <|unfolded-io>
      <html-text|<math|<tabular|<tformat|<cwith|1|-1|1|1|cell-halign|r>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|3|3|cell-halign|l>|<table|<row|<cell|<with|color|red|o5>>|<cell|<with|color|red|=>>|<cell|<around*|(|<tabular|<table|<row|<cell|x<rsub|2>>|<cell|x<rsub|1>-1>>>>|)>>>|<row|<cell|>|<cell|>|<cell|>>|<row|<cell|<with|color|red|o5>>|<cell|<with|color|red|:>>|<cell|Matrix>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      i6 :\ 
    <|unfolded-io>
      G0 = gens gb ideal M
    <|unfolded-io>
      <html-text|<math|<tabular|<tformat|<cwith|1|-1|1|1|cell-halign|r>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|3|3|cell-halign|l>|<table|<row|<cell|<with|color|red|o6>>|<cell|<with|color|red|=>>|<cell|<around*|(|<tabular|<table|<row|<cell|x<rsub|2>>|<cell|x<rsub|1>-1>>>>|)>>>|<row|<cell|>|<cell|>|<cell|>>|<row|<cell|<with|color|red|o6>>|<cell|<with|color|red|:>>|<cell|Matrix>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      i7 :\ 
    <|unfolded-io>
      L = (G0*transpose(G0))_(0,0)
    <|unfolded-io>
      <html-text|<math|<tabular|<tformat|<cwith|1|-1|1|1|cell-halign|r>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|3|3|cell-halign|l>|<table|<row|<cell|<with|color|red|o7>>|<cell|<with|color|red|=>>|<cell|x<rsub|1><rsup|2>+x<rsub|2><rsup|2>-2x<rsub|1>+1>>|<row|<cell|>|<cell|>|<cell|>>|<row|<cell|<with|color|red|o7>>|<cell|<with|color|red|:>>|<cell|R>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      i8 :\ 
    <|unfolded-io>
      L%ideal(G0)
    <|unfolded-io>
      <html-text|<math|<tabular|<tformat|<cwith|1|-1|1|1|cell-halign|r>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|3|3|cell-halign|l>|<table|<row|<cell|<with|color|red|o8>>|<cell|<with|color|red|=>>|<cell|0>>|<row|<cell|>|<cell|>|<cell|>>|<row|<cell|<with|color|red|o8>>|<cell|<with|color|red|:>>|<cell|R>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      i9 :\ 
    <|unfolded-io>
      st = diff(matrix{{x_1,x_2}},p) \| matrix{{L*p}}
    <|unfolded-io>
      <html-text|<math|<tabular|<tformat|<cwith|1|-1|1|1|cell-halign|r>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|3|3|cell-halign|l>|<table|<row|<cell|<with|color|red|o9>>|<cell|<with|color|red|=>>|<cell|<around*|(|<tabular|<table|<row|<cell|2x<rsub|1>-2>|<cell|2x<rsub|2>>|<cell|x<rsub|1><rsup|4>+2x<rsub|1><rsup|2>x<rsub|2><rsup|2>+x<rsub|2><rsup|4>-4x<rsub|1><rsup|3>-4x<rsub|1>x<rsub|2><rsup|2>+<around*|(|<frac|23|4>|)>x<rsub|1><rsup|2>+<around*|(|<frac|7|4>|)>x<rsub|2><rsup|2>-<around*|(|<frac|7|2>|)>x<rsub|1>+<frac|3|4>>>>>|)>>>|<row|<cell|>|<cell|>|<cell|>>|<row|<cell|<with|color|red|o9>>|<cell|<with|color|red|:>>|<cell|Matrix>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      i10 :\ 
    <|unfolded-io>
      gf = syz st
    <|unfolded-io>
      <html-text|<math|<tabular|<tformat|<cwith|1|-1|1|1|cell-halign|r>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|3|3|cell-halign|l>|<table|<row|<cell|<with|color|red|o10>>|<cell|<with|color|red|=>>|<cell|<around*|(|<tabular|<table|<row|<cell|x<rsub|2>>|<cell|-4x<rsub|1><rsup|3>-8x<rsub|1>x<rsub|2><rsup|2>+12x<rsub|1><rsup|2>+8x<rsub|2><rsup|2>-11x<rsub|1>+3>>|<row|<cell|-x<rsub|1>+1>|<cell|-4x<rsub|2><rsup|3>+x<rsub|2>>>|<row|<cell|0>|<cell|8>>>>|)>>>|<row|<cell|>|<cell|>|<cell|>>|<row|<cell|<with|color|red|o10>>|<cell|<with|color|red|:>>|<cell|Matrix>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      i11 :\ 
    <|unfolded-io>
      substitute(gf_(2,1),QQ)
    <|unfolded-io>
      <html-text|<math|<tabular|<tformat|<cwith|1|-1|1|1|cell-halign|r>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|3|3|cell-halign|l>|<table|<row|<cell|<with|color|red|o11>>|<cell|<with|color|red|=>>|<cell|<frac|8|1>>>|<row|<cell|>|<cell|>|<cell|>>|<row|<cell|<with|color|red|o11>>|<cell|<with|color|red|:>>|<cell|\<bbb-Q\>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      i12 :\ 
    <|unfolded-io>
      g = gf_{0}^{0,1}
    <|unfolded-io>
      <html-text|<math|<tabular|<tformat|<cwith|1|-1|1|1|cell-halign|r>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|3|3|cell-halign|l>|<table|<row|<cell|<with|color|red|o12>>|<cell|<with|color|red|=>>|<cell|<around*|(|<tabular|<table|<row|<cell|x<rsub|2>>>|<row|<cell|-x<rsub|1>+1>>>>|)>>>|<row|<cell|>|<cell|>|<cell|>>|<row|<cell|<with|color|red|o12>>|<cell|<with|color|red|:>>|<cell|Matrix>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      i13 :\ 
    <|unfolded-io>
      f = 1/substitute(gf_(2,1),QQ)*(gf_{1}^{0,1})
    <|unfolded-io>
      <html-text|<math|<tabular|<tformat|<cwith|1|-1|1|1|cell-halign|r>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|3|3|cell-halign|l>|<table|<row|<cell|<with|color|red|o13>>|<cell|<with|color|red|=>>|<cell|<around*|(|<tabular|<tformat|<table|<row|<cell|-<around*|(|<frac|1|2>|)>x<rsub|1><rsup|3>-x<rsub|1>x<rsub|2><rsup|2>+<around*|(|<frac|3|2>|)>x<rsub|1><rsup|2>+x<rsub|2><rsup|2>-<around*|(|<frac|11|8>|)>x<rsub|1>+<frac|3|8>>>|<row|<cell|-<around*|(|<frac|1|2>|)>x<rsub|2><rsup|3>+<around*|(|<frac|1|8>|)>x<rsub|2>>>>>>|)>>>|<row|<cell|>|<cell|>|<cell|>>|<row|<cell|<with|color|red|o13>>|<cell|<with|color|red|:>>|<cell|Matrix>>>>>>>
    </unfolded-io>

    <\input>
      i14 :\ 
    <|input>
      loadPackage("NumericSolutions");
    </input>

    <\unfolded-io>
      i15 :\ 
    <|unfolded-io>
      solveSystem(ideal G)
    <|unfolded-io>
      <html-text|<math|<tabular|<tformat|<cwith|1|-1|1|1|cell-halign|r>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|3|3|cell-halign|l>|<table|<row|<cell|<with|color|red|o15>>|<cell|<with|color|red|=>>|<cell|Tally<around*|{|<tabular|<table|<row|<cell|<around*|{|1,0|}>>|<cell|\<Rightarrow\>>|<cell|1>>>>|}>>>|<row|<cell|>|<cell|>|<cell|>>|<row|<cell|<with|color|red|o15>>|<cell|<with|color|red|:>>|<cell|Tally>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      i16 :\ 
    <|unfolded-io>
      M = g \| matrix{{p,0},{0,p}} \| f
    <|unfolded-io>
      <html-text|<math|<tabular|<tformat|<cwith|1|-1|1|1|cell-halign|r>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|3|3|cell-halign|l>|<table|<row|<cell|<with|color|red|o16>>|<cell|<with|color|red|=>>|<cell|<around*|(|<tabular|<table|<row|<cell|x<rsub|2>>|<cell|x<rsub|1><rsup|2>+x<rsub|2><rsup|2>-2x<rsub|1>+<frac|3|4>>|<cell|0>|<cell|-<around*|(|<frac|1|2>|)>x<rsub|1><rsup|3>-x<rsub|1>x<rsub|2><rsup|2>+<around*|(|<frac|3|2>|)>x<rsub|1><rsup|2>+x<rsub|2><rsup|2>-<around*|(|<frac|11|8>|)>x<rsub|1>+<frac|3|8>>>|<row|<cell|-x<rsub|1>+1>|<cell|0>|<cell|x<rsub|1><rsup|2>+x<rsub|2><rsup|2>-2x<rsub|1>+<frac|3|4>>|<cell|-<around*|(|<frac|1|2>|)>x<rsub|2><rsup|3>+<around*|(|<frac|1|8>|)>x<rsub|2>>>>>|)>>>|<row|<cell|>|<cell|>|<cell|>>|<row|<cell|<with|color|red|o16>>|<cell|<with|color|red|:>>|<cell|Matrix>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      i17 :\ 
    <|unfolded-io>
      (numRows M, numColumns M)
    <|unfolded-io>
      <html-text|<math|<tabular|<tformat|<cwith|1|-1|1|1|cell-halign|r>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|3|3|cell-halign|l>|<table|<row|<cell|<with|color|red|o17>>|<cell|<with|color|red|=>>|<cell|<around*|(|2,4|)>>>|<row|<cell|>|<cell|>|<cell|>>|<row|<cell|<with|color|red|o17>>|<cell|<with|color|red|:>>|<cell|Sequence>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      i18 :\ 
    <|unfolded-io>
      R = syz M
    <|unfolded-io>
      <html-text|<math|<tabular|<tformat|<cwith|1|-1|1|1|cell-halign|r>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|3|3|cell-halign|l>|<table|<row|<cell|<with|color|red|o18>>|<cell|<with|color|red|=>>|<cell|<around*|(|<tabular|<table|<row|<cell|4x<rsub|1><rsup|2>+4x<rsub|2><rsup|2>-8x<rsub|1>+3>|<cell|4x<rsub|1>x<rsub|2>-4x<rsub|2>>>|<row|<cell|-4x<rsub|2>>|<cell|4x<rsub|1>-4>>|<row|<cell|4x<rsub|1>-4>|<cell|4x<rsub|2>>>|<row|<cell|0>|<cell|8>>>>|)>>>|<row|<cell|>|<cell|>|<cell|>>|<row|<cell|<with|color|red|o18>>|<cell|<with|color|red|:>>|<cell|Matrix>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      i19 :\ 
    <|unfolded-io>
      (numRows R, numColumns R)
    <|unfolded-io>
      <html-text|<math|<tabular|<tformat|<cwith|1|-1|1|1|cell-halign|r>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|3|3|cell-halign|l>|<table|<row|<cell|<with|color|red|o19>>|<cell|<with|color|red|=>>|<cell|<around*|(|4,2|)>>>|<row|<cell|>|<cell|>|<cell|>>|<row|<cell|<with|color|red|o19>>|<cell|<with|color|red|:>>|<cell|Sequence>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      i20 :\ 
    <|unfolded-io>
      Y = R_(0,0)
    <|unfolded-io>
      <html-text|<math|<tabular|<tformat|<cwith|1|-1|1|1|cell-halign|r>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|3|3|cell-halign|l>|<table|<row|<cell|<with|color|red|o20>>|<cell|<with|color|red|=>>|<cell|4x<rsub|1><rsup|2>+4x<rsub|2><rsup|2>-8x<rsub|1>+3>>|<row|<cell|>|<cell|>|<cell|>>|<row|<cell|<with|color|red|o20>>|<cell|<with|color|red|:>>|<cell|\<bbb-Q\><around*|[|x<rsub|1>,x<rsub|2>|]>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      i21 :\ 
    <|unfolded-io>
      y = substitute(1/R_(3,1),QQ)*R_(0,1)
    <|unfolded-io>
      <html-text|<math|<tabular|<tformat|<cwith|1|-1|1|1|cell-halign|r>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|3|3|cell-halign|l>|<table|<row|<cell|<with|color|red|o21>>|<cell|<with|color|red|=>>|<cell|<around*|(|<frac|1|2>|)>x<rsub|1>x<rsub|2>-<around*|(|<frac|1|2>|)>x<rsub|2>>>|<row|<cell|>|<cell|>|<cell|>>|<row|<cell|<with|color|red|o21>>|<cell|<with|color|red|:>>|<cell|\<bbb-Q\><around*|[|x<rsub|1>,x<rsub|2>|]>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      i22 :\ 
    <|unfolded-io>
      f0 = f+g*y
    <|unfolded-io>
      <html-text|<math|<tabular|<tformat|<cwith|1|-1|1|1|cell-halign|r>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|3|3|cell-halign|l>|<table|<row|<cell|<with|color|red|o22>>|<cell|<with|color|red|=>>|<cell|<around*|(|<tabular|<tformat|<table|<row|<cell|-<around*|(|<frac|1|2>|)>x<rsub|1><rsup|3>-<around*|(|<frac|1|2>|)>x<rsub|1>x<rsub|2><rsup|2>+<around*|(|<frac|3|2>|)>x<rsub|1><rsup|2>+<around*|(|<frac|1|2>|)>x<rsub|2><rsup|2>-<around*|(|<frac|11|8>|)>x<rsub|1>+<frac|3|8>>>|<row|<cell|-<around*|(|<frac|1|2>|)>x<rsub|1><rsup|2>x<rsub|2>-<around*|(|<frac|1|2>|)>x<rsub|2><rsup|3>+x<rsub|1>x<rsub|2>-<around*|(|<frac|3|8>|)>x<rsub|2>>>>>>|)>>>|<row|<cell|>|<cell|>|<cell|>>|<row|<cell|<with|color|red|o22>>|<cell|<with|color|red|:>>|<cell|Matrix>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      i23 :\ 
    <|unfolded-io>
      g
    <|unfolded-io>
      <html-text|<math|<tabular|<tformat|<cwith|1|-1|1|1|cell-halign|r>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|3|3|cell-halign|l>|<table|<row|<cell|<with|color|red|o23>>|<cell|<with|color|red|=>>|<cell|<around*|(|<tabular|<table|<row|<cell|x<rsub|2>>>|<row|<cell|-x<rsub|1>+1>>>>|)>>>|<row|<cell|>|<cell|>|<cell|>>|<row|<cell|<with|color|red|o23>>|<cell|<with|color|red|:>>|<cell|Matrix>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      i24 :\ 
    <|unfolded-io>
      f0_(0,0)%ideal(p)
    <|unfolded-io>
      <html-text|<math|<tabular|<tformat|<cwith|1|-1|1|1|cell-halign|r>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|3|3|cell-halign|l>|<table|<row|<cell|<with|color|red|o24>>|<cell|<with|color|red|=>>|<cell|0>>|<row|<cell|>|<cell|>|<cell|>>|<row|<cell|<with|color|red|o24>>|<cell|<with|color|red|:>>|<cell|\<bbb-Q\><around*|[|x<rsub|1>,x<rsub|2>|]>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      i25 :\ 
    <|unfolded-io>
      f0_(1,0)%ideal(p)
    <|unfolded-io>
      <html-text|<math|<tabular|<tformat|<cwith|1|-1|1|1|cell-halign|r>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|3|3|cell-halign|l>|<table|<row|<cell|<with|color|red|o25>>|<cell|<with|color|red|=>>|<cell|0>>|<row|<cell|>|<cell|>|<cell|>>|<row|<cell|<with|color|red|o25>>|<cell|<with|color|red|:>>|<cell|\<bbb-Q\><around*|[|x<rsub|1>,x<rsub|2>|]>>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      i26 :\ 
    <|unfolded-io>
      toString f0_(0,0)
    <|unfolded-io>
      <html-text|<math|<tabular|<tformat|<cwith|1|-1|1|1|cell-halign|r>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|3|3|cell-halign|l>|<table|<row|<cell|<with|color|red|o26>>|<cell|<with|color|red|=>>|<cell|<with|mode|text|-(1/2)*x_1^3-(1/2)*x_1*x_2^2+(3/2)*x_1^2+(1/2)*x_2^2-(11/8)*x_1+3/8>>>|<row|<cell|>|<cell|>|<cell|>>|<row|<cell|<with|color|red|o26>>|<cell|<with|color|red|:>>|<cell|String>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      i27 :\ 
    <|unfolded-io>
      toString f0_(1,0)
    <|unfolded-io>
      <html-text|<math|<tabular|<tformat|<cwith|1|-1|1|1|cell-halign|r>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|3|3|cell-halign|l>|<table|<row|<cell|<with|color|red|o27>>|<cell|<with|color|red|=>>|<cell|<with|mode|text|-(1/2)*x_1^2*x_2-(1/2)*x_2^3+x_1*x_2-(3/8)*x_2>>>|<row|<cell|>|<cell|>|<cell|>>|<row|<cell|<with|color|red|o27>>|<cell|<with|color|red|:>>|<cell|String>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      i28 :\ 
    <|unfolded-io>
      toString g_(0,0)
    <|unfolded-io>
      <html-text|<math|<tabular|<tformat|<cwith|1|-1|1|1|cell-halign|r>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|3|3|cell-halign|l>|<table|<row|<cell|<with|color|red|o28>>|<cell|<with|color|red|=>>|<cell|<with|mode|text|x_2>>>|<row|<cell|>|<cell|>|<cell|>>|<row|<cell|<with|color|red|o28>>|<cell|<with|color|red|:>>|<cell|String>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      i29 :\ 
    <|unfolded-io>
      toString g_(1,0)
    <|unfolded-io>
      <html-text|<math|<tabular|<tformat|<cwith|1|-1|1|1|cell-halign|r>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|3|3|cell-halign|l>|<table|<row|<cell|<with|color|red|o29>>|<cell|<with|color|red|=>>|<cell|<with|mode|text|-x_1+1>>>|<row|<cell|>|<cell|>|<cell|>>|<row|<cell|<with|color|red|o29>>|<cell|<with|color|red|:>>|<cell|String>>>>>>>
    </unfolded-io>

    <\unfolded-io>
      i30 :\ 
    <|unfolded-io>
      toString p
    <|unfolded-io>
      <html-text|<math|<tabular|<tformat|<cwith|1|-1|1|1|cell-halign|r>|<cwith|1|-1|2|2|cell-halign|c>|<cwith|1|-1|3|3|cell-halign|l>|<table|<row|<cell|<with|color|red|o30>>|<cell|<with|color|red|=>>|<cell|<with|mode|text|x_1^2+x_2^2-2*x_1+3/4>>>|<row|<cell|>|<cell|>|<cell|>>|<row|<cell|<with|color|red|o30>>|<cell|<with|color|red|:>>|<cell|String>>>>>>>
    </unfolded-io>

    <\input>
      i33 :\ 
    <|input>
      \;
    </input>
  </session>
</body>

<initial|<\collection>
</collection>>