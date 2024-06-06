part of '../view.dart';

class CategoriesSection extends StatefulWidget {
  const CategoriesSection({super.key});

  @override
  State<CategoriesSection> createState() => _CategoriesSectionState();
}

class _CategoriesSectionState extends State<CategoriesSection> {
  final bloc = KiwiContainer().resolve<CategoryBloc>()..add(GetCategoryEvent());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'الأقسام',
              style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w800,
                  fontFamily: 'Tajawal'),
            ),
            const Spacer(),
            GestureDetector(
              child: Text(
                'عرض الكل',
                style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w300,
                    fontFamily: 'Tajawal',
                    color: Theme.of(context).primaryColor),
              ),
            ),
          ],
        ),
        BlocConsumer(
          listener: (context, state) {},
          bloc: bloc,
          builder: (context, state) {
            if (state is CategoryFailedState) {
              return AppFailed(msg: state.msg);
            } else if (state is CategorySuccessState) {
              return Padding(
                padding: EdgeInsetsDirectional.only(bottom: 16.h),
                child: Column(
                  children: [
                    SizedBox(
                      height: 18.h,
                    ),
                    SizedBox(
                      height: 120.h,
                      child: ListView.separated(
                        separatorBuilder: (context, index) => SizedBox(
                          width: 18.w,
                        ),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                           // navigateTo(CategoryProductsView());
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              AppImage(
                                state.list[index].media,
                                height: 73.h,
                                width: 73.w,
                              ),
                              Text(
                                state.list[index].name,
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    fontFamily: 'Tajawal',
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xff3E3E3E)),
                              )
                            ],
                          ),
                        ),
                        itemCount: state.list.length,
                      ),
                    )
                  ],
                ),
              );
            } else {
              return const AppLoading();
            }
          },
        ),
      ],
    );
  }
}
