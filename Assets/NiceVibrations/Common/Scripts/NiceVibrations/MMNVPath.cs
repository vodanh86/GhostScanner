using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace MoreMountains.NiceVibrations
{
    [CreateAssetMenu(fileName = "MMNVPathDefinition", menuName = "MoreMountains/NiceVibrations/MMNVPathDefinition")]
    public class MMNVPath : ScriptableObject
    {
        public string PluginPath;
        public string ModuleFileName;
        public string PluginRelativePath;
    }
}
