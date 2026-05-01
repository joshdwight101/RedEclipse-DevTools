const canvas=document.getElementById('terrain');const ctx=canvas.getContext('2d');
function noise(x,y,s){return (Math.sin(x*s)+Math.cos(y*s))*0.5+0.5}
function render(){const seed=Number(seedEl.value||1337);const w=Number(widthEl.value||64);const h=Number(heightEl.value||64);for(let y=0;y<512;y++){for(let x=0;x<512;x++){const v=noise((x+seed%97)/8,(y+seed%89)/8,0.12);const c=Math.floor(v*255);ctx.fillStyle=`rgb(${c},${c},${c})`;ctx.fillRect(x,y,1,1)}}
cmd.textContent=`pwsh -File src/powershell/Tools/ProceduralWorldBuilder/Start-ProceduralWorldBuilder.ps1 -Seed ${seed} -Width ${w} -Height ${h}`;}
const seedEl=document.getElementById('seed'),widthEl=document.getElementById('width'),heightEl=document.getElementById('height'),cmd=document.getElementById('cmd');
document.getElementById('preview').onclick=render;document.getElementById('copy').onclick=()=>navigator.clipboard.writeText(cmd.textContent);render();
