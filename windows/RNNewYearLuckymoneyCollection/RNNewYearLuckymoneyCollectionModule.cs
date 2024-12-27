using ReactNative.Bridge;
using System;
using System.Collections.Generic;
using Windows.ApplicationModel.Core;
using Windows.UI.Core;

namespace New.Year.Luckymoney.Collection.RNNewYearLuckymoneyCollection
{
    /// <summary>
    /// A module that allows JS to share data.
    /// </summary>
    class RNNewYearLuckymoneyCollectionModule : NativeModuleBase
    {
        /// <summary>
        /// Instantiates the <see cref="RNNewYearLuckymoneyCollectionModule"/>.
        /// </summary>
        internal RNNewYearLuckymoneyCollectionModule()
        {

        }

        /// <summary>
        /// The name of the native module.
        /// </summary>
        public override string Name
        {
            get
            {
                return "RNNewYearLuckymoneyCollection";
            }
        }
    }
}
