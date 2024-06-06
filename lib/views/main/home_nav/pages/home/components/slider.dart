part of '../view.dart';
class SliderSection extends StatefulWidget {
  const SliderSection({super.key});

  @override
  State<SliderSection> createState() => _SliderSectionState();
}

class _SliderSectionState extends State<SliderSection> {
  final bloc=KiwiContainer().resolve<SliderBloc>()..add(GetSliderEvent());
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: bloc,
        builder: (context, state) {
      if(state is SliderFailedState){
        return AppFailed(msg: state.msg,);
      }else if(state is SliderSuccessState){
        return Padding(
          padding:  EdgeInsetsDirectional.only(bottom: 20.h),
          child: CarouselSlider.builder(
            itemBuilder: (context, index, realIndex) =>AppImage(state.list[index].media,width: double.infinity,),
            options: CarouselOptions(
              viewportFraction: 1,
              autoPlay: true,
            ),
            itemCount: state.list.length,
          ),
        );
      }else{
        return const AppLoading();
      }
    }

      );
  }
}
