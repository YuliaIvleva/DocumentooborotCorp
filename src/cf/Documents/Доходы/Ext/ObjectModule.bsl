﻿
Процедура ОбработкаПроведения(Отказ, Режим)
	//{{__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ
	// Данный фрагмент построен конструктором.
	// При повторном использовании конструктора, внесенные вручную изменения будут утеряны!!!
	
	Сумма = 0;
	Движения.Доходы.Записывать = Истина;
	Для Каждого ТекСтрокаДоходы Из Доходы Цикл
		 Сумма = Сумма + ТекСтрокаДоходы.Сумма;
	КонецЦикла;
	Движение = Движения.Доходы.Добавить();
	Движение.ВидДвижения = ВидДвиженияНакопления.Приход;
	Движение.Период = Дата;
	Движение.Сумма = Сумма;

	
	//}}__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ
КонецПроцедуры
