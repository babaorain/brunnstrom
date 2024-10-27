<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Brunnstrom 分期评估工具</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 30px;
            background-color: #ffffff;
            color: #000000;
        }
        h1 {
            text-align: center;
            color: #333333;
        }
        .question {
            margin-bottom: 20px;
            background-color: #f9f9f9;
            padding: 15px;
            border: 1px solid #dddddd;
            border-radius: 5px;
            box-shadow: 2px 2px 12px rgb(0 0 0 / 10%);
        }
        .question label {
            font-weight: bold;
            color: #333333;
        }
        .options {
            margin-top: 10px;
        }
        .options input {
            margin-right: 10px;
        }
        .result {
            font-size: 24px;
            font-weight: bold;
            margin-top: 30px;
            text-align: center;
            color: #000000;
        }
        .btn {
            display: block;
            margin: 20px auto;
            padding: 15px 40px;
            font-size: 20px;
            background-color: #00796b;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .btn:hover {
            background-color: #004d40;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
        }
        .footer {
            text-align: center;
            margin-top: 50px;
            color: #777;
        }
        /* 响应式设计 */
        @media (max-width: 600px) {
            body {
                margin: 10px;
            }
            .result {
                font-size: 20px;
            }
            .question {
                padding: 10px;
            }
            .btn {
                padding: 10px 20px;
                font-size: 18px;
            }
        }
    </style>
</head>
<body>

<div class="container">
    <h1>Brunnstrom 分期评估工具</h1>

    <form id="brunnstromForm">
        <!-- 问题1 -->
        <div class="question">
            <label>1. 患者是否有任何自主的肌肉收缩？</label>
            <div class="options">
                <input type="radio" name="q1" value="yes" required> 是<br>
                <input type="radio" name="q1" value="no"> 否
            </div>
        </div>

        <!-- 问题2 -->
        <div class="question">
            <label>2. 患者是否出现痉挛？</label>
            <div class="options">
                <input type="radio" name="q2" value="yes" required> 是<br>
                <input type="radio" name="q2" value="no"> 否
            </div>
        </div>

        <!-- 问题3 -->
        <div class="question">
            <label>3. 患者能否自主完成基本的肢体协同运动？</label>
            <div class="options">
                <input type="radio" name="q3" value="yes" required> 是<br>
                <input type="radio" name="q3" value="no"> 否
            </div>
        </div>

        <!-- 问题4 -->
        <div class="question">
            <label>4. 患者能否进行协同运动之外的部分动作？</label>
            <div class="options">
                <input type="radio" name="q4" value="yes" required> 是<br>
                <input type="radio" name="q4" value="no"> 否
            </div>
        </div>

        <!-- 问题5 -->
        <div class="question">
            <label>5. 患者的痉挛是否明显减弱？</label>
            <div class="options">
                <input type="radio" name="q5" value="yes" required> 是<br>
                <input type="radio" name="q5" value="no"> 否
            </div>
        </div>

        <!-- 问题6 -->
        <div class="question">
            <label>6. 患者能否进行单独的关节运动？</label>
            <div class="options">
                <input type="radio" name="q6" value="yes" required> 是<br>
                <input type="radio" name="q6" value="no"> 否
            </div>
        </div>

        <!-- 问题7 -->
        <div class="question">
            <label>7. 患者的运动功能是否已恢复正常？</label>
            <div class="options">
                <input type="radio" name="q7" value="yes" required> 是<br>
                <input type="radio" name="q7" value="no"> 否
            </div>
        </div>

        <!-- 评估按钮 -->
        <button type="button" class="btn" onclick="evaluateBrunnstrom()">评估</button>
    </form>

    <!-- 结果显示 -->
    <div class="result" id="result"></div>

</div>

<div class="footer">
    &copy; BigbigDada
</div>

<script>
    function evaluateBrunnstrom() {
        var form = document.getElementById('brunnstromForm');
        var elements = form.elements;

        var q1 = elements['q1'].value;
        var q2 = elements['q2'].value;
        var q3 = elements['q3'].value;
        var q4 = elements['q4'].value;
        var q5 = elements['q5'].value;
        var q6 = elements['q6'].value;
        var q7 = elements['q7'].value;

        var result = '';

        if (q1 === 'no') {
            result = 'Brunnstrom 分期：I期（松弛期）';
        } else if (q2 === 'yes' && q3 === 'no') {
            result = 'Brunnstrom 分期：II期（痉挛出现）';
        } else if (q3 === 'yes' && q4 === 'no') {
            result = 'Brunnstrom 分期：III期（痉挛加重）';
        } else if (q4 === 'yes' && q5 === 'yes' && q6 === 'no') {
            result = 'Brunnstrom 分期：IV期（痉挛减轻）';
        } else if (q6 === 'yes' && q7 === 'no') {
            result = 'Brunnstrom 分期：V期（复杂运动出现）';
        } else if (q7 === 'yes') {
            result = 'Brunnstrom 分期：VI期（协同运动消失）';
        } else {
            result = 'Brunnstrom 分期：VII期（正常功能）';
        }

        document.getElementById('result').innerText = result;
    }
</script>

</body>
</html>
