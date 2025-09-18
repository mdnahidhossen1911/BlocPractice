import 'package:bloc/bloc.dart';
import 'package:bloc_practice/bloc/counter/counter_event.dart';
import 'package:bloc_practice/bloc/counter/counter_state.dart';



/*
আচ্ছা ভাই, এবার আমি কোনো bullet point ছাড়াই ধারাবাহিকভাবে বোঝাচ্ছি।

যখন আপনি `CounterBloc` বানান, তখন প্রথমেই এর ভেতরে একটি initial state তৈরি হয় যেটা count = 0 দিয়ে শুরু হয়।
 এই initial state টা Bloc সবসময় নিজের মধ্যে ধরে রাখে, যেটা আমরা `state` দিয়ে পাই। এরপর constructor এ
 যেই `on<Increment>(_increment)` আর `on<Decrement>(_decrement)` লিখেছেন, ওগুলো Bloc কে বলে দেয় কোন
 event এলে কোন function চালাতে হবে।

এখন ধরুন ইউজার UI থেকে একটি বাটনে চাপ দিল এবং আপনি Bloc এ `add(Increment())` পাঠালেন। তখন Bloc তার ভেতরে
event চেক করে দেখে এটা Increment event। যেহেতু আপনি আগে register করেছেন, তাই `_increment` method চালু হবে।
 `_increment` method এর ভেতরে state.copyWith(count: state.count + 1) দিয়ে নতুন state তৈরি হয় এবং emit()
  এর মাধ্যমে সেই state Bloc এর ভেতরের stream এ পাঠানো হয়। Bloc তখন current state কে update করে দেয়।

UI যেটা BlocBuilder বা BlocListener এর মাধ্যমে state এর stream কে শুনছে, সেটি সাথে সাথে নতুন state পেয়ে যায়।
 তখন UI আবার redraw হয়ে যায় এবং count নতুন মানে দেখাতে শুরু করে।

ঠিক একইভাবে যখন Decrement event আসে, তখন `_decrement` method চালু হয়, state থেকে এক কমানো হয় এবং
emit দিয়ে নতুন state পাঠানো হয়। Bloc আবার stream এ সেটা দেয় এবং UI নতুন count দেখাতে শুরু করে।

ভেতরে আসলে Bloc একটাই কাজ বারবার করে। Event এলে সঠিক handler চালায়, সেই handler নতুন state বানিয়ে emit করে
 আর UI তে পাঠিয়ে দেয়। এই চক্রটাই Bloc এর মূল কাজ।

ভাই, আপনি চাইলে আমি এখন UI অংশে BlocBuilder ব্যবহার করে একটা ছোট উদাহরণ লিখে দিতে পারি যাতে আপনার পুরো flow টা
চোখে দেখা যায়। আপনি কি সেটা চান?

*/


// Bloc মূলত Event আর State ম্যানেজ করার জন্য ব্যবহৃত হয়
class CounterBloc extends Bloc<CounterEvent, CounterState> {

  // Bloc এর constructor
  // এখানে আমরা initial state সেট করছি -> count = 0
  CounterBloc() : super(const CounterState(count: 0)) {

    // Increment event এলে _increment মেথড কল হবে
    on<Increment>(_increment);

    // Decrement event এলে _decrement মেথড কল হবে
    on<Decrement>(_decrement);
  }

  // Increment event handle করার মেথড
  // emit() দিয়ে নতুন state পাঠানো হয়
  void _increment(Increment event, Emitter<CounterState> emit) {
    // আগের state থেকে count নিয়ে +1 করে নতুন state তৈরি
    emit(state.copyWith(count: state.count + 1));
  }

  // Decrement event handle করার মেথড
  void _decrement(Decrement event, Emitter<CounterState> emit) {
    // আগের state থেকে count নিয়ে -1 করে নতুন state তৈরি
    emit(state.copyWith(count: state.count - 1));
  }
}
