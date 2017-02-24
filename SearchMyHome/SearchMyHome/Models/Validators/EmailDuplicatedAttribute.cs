using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using SearchMyHome.DataAccess;


namespace SearchMyHome.Models.Validators
{
    public class EmailDuplicatedAttribute:ValidationAttribute
    {
        private string _emailToValidate;
        private SearchMyHomeDBEntities _entities = new SearchMyHomeDBEntities();

        public  bool IsEmailValid(object value)
        {
            this._emailToValidate = (string)value;
            string[] Eamils = _entities.Suscriptor.Select(model => model.correoElectronico).ToArray();
            bool ExistEmail = Eamils.Contains(this._emailToValidate);

            return ExistEmail;
        }
        protected override ValidationResult IsValid(object value, ValidationContext validationContext)
        {
            if (IsEmailValid(value)) {
                return new ValidationResult(this.ErrorMessage);
            }
            return ValidationResult.Success;
        }
    }
}