namespace DemoApplication.Models.Attributes
{
    using System.ComponentModel.DataAnnotations;
    using System.Web.Mvc;

    public class TextboxAttribute : DataTypeAttribute, IMetadataAware
    {
        private TextboxSize _textboxSize = TextboxSize.XLarge;
        private string _placeholderText = string.Empty;
        private string _mask;

        public TextboxAttribute(string dataType)
            : base(dataType)
        {
        }

        public TextboxAttribute(): this("string")
        {   
        }

        public TextboxAttribute(DataType baseDataType) : base(baseDataType)
        {
        }

        public TextboxSize TextboxSize
        {
            get { return _textboxSize; }
            set { _textboxSize = value; }
        }

        public string PlaceholderText
        {
            get { return _placeholderText; }
            set { _placeholderText = value; }
        }

        public string Mask
        {
            get { return _mask; }
            set { _mask = value; }
        }

        public void OnMetadataCreated(ModelMetadata metadata)
        {
            metadata.AdditionalValues["textbox-size"] = _textboxSize;
            metadata.AdditionalValues["placeholder"] = _placeholderText;
            metadata.AdditionalValues["mask"] = _mask;
        }
    }

}