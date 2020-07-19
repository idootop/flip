require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"

activity.setContentView(loadlayout("layout"))

if Build.VERSION.SDK_INT >= 19 then
  activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS);
end

flipTable = {
    ['!'] = '¡',
    ['"'] = '„',
    ['&'] = '⅋',
    ["'"] = ',',
    ['3'] = 'Ɛ',
    ['4'] = 'ᔭ',
    ['6'] = '9',
    ['7'] = 'Ɫ',
    [';'] = '؛',
    ['?'] = '¿',
    ['A'] = '∀',
    ['B'] = 'ᗺ',
    ['C'] = 'Ↄ',
    ['D'] = 'ᗡ',
    ['E'] = 'Ǝ',
    ['F'] = 'Ⅎ',
    ['G'] = '⅁',
    ['J'] = 'ſ',
    ['K'] = '⋊',
    ['L'] = '⅂',
    ['M'] = 'W',
    ['N'] = 'ᴎ',
    ['P'] = 'Ԁ',
    ['Q'] = 'Ό',
    ['R'] = 'ᴚ',
    ['T'] = '⊥',
    ['U'] = '∩',
    ['V'] = 'ᴧ',
    ['Y'] = '⅄',
    ['_'] = '‾',
    ['a'] = 'ɐ',
    ['b'] = 'q',
    ['c'] = 'ɔ',
    ['d'] = 'p',
    ['e'] = 'ǝ',
    ['f'] = 'ɟ',
    ['g'] = 'ƃ',
    ['h'] = 'ɥ',
    ['i'] = 'ı',
    ['j'] = 'ɾ',
    ['k'] = 'ʞ',
    ['l'] = '❘',
    ['m'] = 'ɯ',
    ['n'] = 'u',
    ['r'] = 'ɹ',
    ['t'] = 'ʇ',
    ['v'] = 'ʌ',
    ['w'] = 'ʍ',
    ['y'] = 'ʎ',
    ['‿'] = '⁀',
    ['⁅'] = '⁆',
    ['∴'] = '∵',
    ['é'] = 'ǝ',
    ['('] = ')',
    ['['] = ']',
    ['{'] = '}',
    ['<'] = '>',
    --['\r'] = '\n',
    ["."]="˙",
}

function toList(s)
    local list = {}
    for i = 1, #s do
        list[i] = string.sub(s, i, i)
    end
    return list
end

function flipLR(s)
    s = toList(s)
    local result = ''
    for i = 1, #s do
        flag = 0
        for k, v in pairs(flipTable) do
            if k == s[i] then
                result = result .. v
                flag = 0
                break
            elseif v == s[i] then
                result = result .. k
                flag = 0
                break
            else
                flag = 1
            end
        end
        if flag == 1 then
            result = result .. s[i]
        end
    end
    return result
end

function flip(s)
    return flipLR(string.reverse(s))
end

copy.onClick=function()
  import "android.content.*"
  activity.getSystemService(Context.CLIPBOARD_SERVICE).setText(out)
  print('已复制');
end

card.onClick=function()
  import "android.content.Context"
  task(100,function()
    activity.getSystemService(Context.INPUT_METHOD_SERVICE).showSoftInput(input, 0)
  end)
end

input.addTextChangedListener{
  onTextChanged=function(s)
    out=flip(input.Text)
    output.setText("倒转结果:\n"..out);
  end
}

output.onClick=function()
  import "android.content.*"
  activity.getSystemService(Context.CLIPBOARD_SERVICE).setText(out)
  print('已复制');
end

about.onClick=function()
  AlertDialog.Builder(this)
  .setTitle("关于")
  .setMessage("英文倒转是一个有趣的工具，我在 David Faden的http://www.revfad.com/flip.html基础上将其移植到了小程序端,以及安卓应用。")
  .setPositiveButton("晓得了",nil)
  .show();
end



