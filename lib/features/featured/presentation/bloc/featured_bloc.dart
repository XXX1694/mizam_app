import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'featured_event.dart';
part 'featured_state.dart';

class FeaturedBloc extends Bloc<FeaturedEvent, FeaturedState> {
  FeaturedBloc() : super(FeaturedInitial()) {
    on<FeaturedEvent>((event, emit) {});
  }
}
