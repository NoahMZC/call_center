- dashboard: '4__'
  title: 4_상담원 평가
  layout: newspaper
  preferred_viewer: dashboards
  crossfilter_enabled: true
  description: ''
  preferred_slug: 5kxrH6SEfcxWdZi1Gts3La
  elements:
  - title: Number of Conversations
    name: Number of Conversations
    model: Looker_Demo_call_center
    explore: transcript
    type: single_value
    fields: [transcript.count, transcript.conversation_start_week]
    fill_fields: [transcript.conversation_start_week]
    filters:
      transcript.conversation_start_week: 2 weeks ago for 2 weeks
    sorts: [transcript.conversation_start_week desc]
    limit: 500
    dynamic_fields: [{table_calculation: difference_in_calls, label: 'Difference in
          # Calls', expression: "${transcript.count}-offset(${transcript.count},1)",
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Prior Week
    defaults_version: 1
    hidden_fields: [transcript.conversation_start_week]
    listen:
      상담원 명: agents.name
      기간: transcript.conversation_start_date
    row: 30
    col: 10
    width: 5
    height: 4
  - title: Average Call Duration
    name: Average Call Duration
    model: Looker_Demo_call_center
    explore: transcript
    type: single_value
    fields: [transcript.average_conversation_duration]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: duration_in_minutes, label: Duration in Minutes,
        expression: "${transcript.average_conversation_duration}/60", value_format: !!null '',
        value_format_name: decimal_1, _kind_hint: measure, _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: 평균 통화 시간
    value_format: '#.# "분"'
    comparison_label: Percent without Live Agent
    defaults_version: 1
    hidden_fields: [transcript.average_conversation_duration]
    listen:
      상담원 명: agents.name
      기간: transcript.conversation_start_date
    row: 2
    col: 8
    width: 5
    height: 4
  - title: High Priority Clients
    name: High Priority Clients
    model: Looker_Demo_call_center
    explore: transcript
    type: single_value
    fields: [client.number_of_clients]
    filters:
      transcript.count: ">0"
      banking_client_facts.balance_yesterday: ">5000"
    limit: 15
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: transcript.count, id: transcript.count,
            name: Number of Conversations}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}, {label: !!null '',
        orientation: right, series: [{axisId: banking_client_facts.total_in_accounts_yesterday,
            id: banking_client_facts.total_in_accounts_yesterday, name: Total In Accounts
              Yesterday}], showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    series_colors:
      banking_client_facts.total_in_accounts_yesterday: "#72D16D"
      transcript.count: "#FFD95F"
    defaults_version: 1
    series_types: {}
    listen:
      상담원 명: agents.name
      기간: transcript.conversation_start_date
    row: 30
    col: 5
    width: 5
    height: 4
  - title: 카테고리별 상담 수
    name: 카테고리별 상담 수
    model: Looker_Demo_call_center
    explore: transcript
    type: looker_area
    fields: [transcript__messages.number_of_messages, transcript__messages.issue_topic,
      transcript.conversation_start_week]
    pivots: [transcript__messages.issue_topic]
    fill_fields: [transcript.conversation_start_week]
    filters:
      transcript__messages.issue_topic: "-NULL"
    sorts: [transcript__messages.number_of_messages desc 0, transcript__messages.issue_topic]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: transcript__messages.number_of_messages,
            id: transcript__messages.number_of_messages, name: Number of Messages}],
        showLabels: false, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    series_types: {}
    series_colors:
      Yes - transcript__messages.number_of_messages: "#E57947"
      Credit Card - transcript__messages.number_of_messages: "#3EB0D5"
      Change Personal Information - transcript__messages.number_of_messages: "#4276BE"
      Online Banking - transcript__messages.number_of_messages: "#75E2E2"
      Open a New Account - transcript__messages.number_of_messages: "#C2DD67"
      Speak with an Advisor - transcript__messages.number_of_messages: "#72D16D"
      Submit a Fraud Alert - transcript__messages.number_of_messages: "#FBB555"
    series_labels:
      Yes - transcript__messages.number_of_messages: From Live Agent
      No - transcript__messages.number_of_messages: From Virtual Agent
      Change Personal Information - transcript__messages.number_of_messages: 개인정보
        변경
      Credit Card - transcript__messages.number_of_messages: 카드 상담
      Online Banking - transcript__messages.number_of_messages: 온라인 뱅킹
      Open a New Account - transcript__messages.number_of_messages: 새 계좌 신설
      Submit a Fraud Alert - transcript__messages.number_of_messages: 금융 사기 신고
      Speak with an Advisor - transcript__messages.number_of_messages: 타 부서 연결
    ordering: none
    show_null_labels: false
    defaults_version: 1
    listen:
      상담원 명: agents.name
      기간: transcript.conversation_start_date
    row: 6
    col: 0
    width: 24
    height: 7
  - title: Average Sentiment
    name: Average Sentiment
    model: Looker_Demo_call_center
    explore: transcript
    type: single_value
    fields: [transcript__messages.average_sentiment, transcript__messages.average_sentiment_category]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: 상담 만족도
    comparison_label: 의 평가를 받습니다.
    defaults_version: 1
    listen:
      상담원 명: agents.name
      기간: transcript.conversation_start_date
    row: 2
    col: 3
    width: 5
    height: 4
  - title: 고객 평가 현황
    name: 고객 평가 현황
    model: Looker_Demo_call_center
    explore: transcript
    type: looker_grid
    fields: [satisfaction_ratings.conversation_id, satisfaction_ratings.comment, satisfaction_ratings.score,
      transcript.conversation_start_date]
    sorts: [transcript.conversation_start_date desc]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_labels:
      satisfaction_ratings.conversation_id: 고객 ID
      satisfaction_ratings.comment: 코멘트
      satisfaction_ratings.score: 상담 만족도
      transcript.conversation_start_date: 상담일
    series_types: {}
    defaults_version: 1
    listen:
      상담원 명: agents.name
      기간: transcript.conversation_start_date
    row: 13
    col: 0
    width: 12
    height: 10
  - title: 카테고리별 상담 시간
    name: 카테고리별 상담 시간
    model: Looker_Demo_call_center
    explore: transcript
    type: looker_column
    fields: [transcript.average_conversation_duration, transcript__messages.issue_topic,
      transcript.conversation_start_month]
    pivots: [transcript__messages.issue_topic]
    fill_fields: [transcript.conversation_start_month]
    filters:
      transcript.conversation_start_week: 1 years
    sorts: [transcript__messages.issue_topic, transcript.conversation_start_month
        desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: 평균 통화 시간, orientation: left, series: [{axisId: transcript.average_conversation_duration,
            id: Change Personal Information - transcript.average_conversation_duration,
            name: 개인정보 변경}, {axisId: transcript.average_conversation_duration, id: Credit
              Card - transcript.average_conversation_duration, name: 카드 관련 업무}, {
            axisId: transcript.average_conversation_duration, id: Online Banking -
              transcript.average_conversation_duration, name: 온라인 뱅킹}, {axisId: transcript.average_conversation_duration,
            id: Open a New Account - transcript.average_conversation_duration, name: 새
              계좌 신설}, {axisId: transcript.average_conversation_duration, id: Speak
              with an Advisor - transcript.average_conversation_duration, name: 타
              부서 연결}, {axisId: transcript.average_conversation_duration, id: Submit
              a Fraud Alert - transcript.average_conversation_duration, name: 금융 사기
              신고}], showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    x_axis_label: 상담일
    series_types: {}
    series_colors:
      Change Personal Information - transcript.average_conversation_duration: "#4276BE"
      Credit Card - transcript.average_conversation_duration: "#FBB555"
      Open a New Account - transcript.average_conversation_duration: "#592EC2"
      Speak with an Advisor - transcript.average_conversation_duration: "#3EB0D5"
      Submit a Fraud Alert - transcript.average_conversation_duration: "#FFD95F"
    series_labels:
      Change Personal Information - transcript.average_conversation_duration: 개인정보
        변경
      Credit Card - transcript.average_conversation_duration: 카드 상담
      Online Banking - transcript.average_conversation_duration: 온라인 뱅킹
      Open a New Account - transcript.average_conversation_duration: 새 계좌 신설
      Speak with an Advisor - transcript.average_conversation_duration: 타 부서 연결
      Submit a Fraud Alert - transcript.average_conversation_duration: 금융 사기 신고
    defaults_version: 1
    listen:
      상담원 명: agents.name
      기간: transcript.conversation_start_date
    row: 13
    col: 12
    width: 12
    height: 10
  - title: 고객/상담원 대화 비율
    name: 고객/상담원 대화 비율
    model: Looker_Demo_call_center
    explore: transcript
    type: looker_donut_multiples
    fields: [transcript__messages.total_seconds_agent_speaking, transcript__messages.total_seconds_client_speaking]
    limit: 500
    column_limit: 50
    show_value_labels: false
    font_size: 12
    series_colors:
      transcript__messages.total_seconds_agent_speaking: "#4276BE"
      transcript__messages.total_seconds_client_speaking: "#FBB555"
    series_labels:
      transcript__messages.total_seconds_agent_speaking: 상담원 응답 시간
      transcript__messages.total_seconds_client_speaking: 고객 문의 시간
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    value_labels: legend
    label_type: labPer
    listen:
      기간: transcript.conversation_start_date
    row: 2
    col: 13
    width: 5
    height: 4
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: ''
    row: 23
    col: 0
    width: 23
    height: 7
  - name: " (2)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |-
      <div style="border-bottom: solid 1px #4285F4;">

      <nav style="font-size: 18px; padding: 5px 10px 0 10px; height: 60px">

        <a style="padding: 5px 15px; border-bottom: solid 1px #4285F4; float: left; line-height: 40px;"
       href="/dashboards/looker_demo_thelook::1___?%EC%A0%91%EC%86%8D+%EB%B8%8C%EB%9D%BC%EC%9A%B0%EC%A0%80=Chrome&%EC%9C%A0%EC%9E%85+%EA%B2%BD%EB%A1%9C=Search&%EA%B8%B0%EA%B0%84=2+weeks">1_웹페이지 접속자 분석</a>

        <a style="padding: 5px 15px; border-bottom: solid 1px #4285F4; float: left; line-height: 40px;"  href="https://megazonepartner.cloud.looker.com/dashboards/Looker_Demo_retail_block_model::group_overview_ko?%EA%B8%B0%EA%B0%84=7+days">2_매장 판매 현황</a>

        <a style="padding: 5px 15px; border-bottom: solid 1px #4285F4; float: left; line-height: 40px;"  href="/dashboards/Looker_Demo_retail_block_model::item_affinity_analysis_ko?Product+Level=product&Analysis+Timeframe=90+days&Focus+Product=&Focus+Category=&Minimum+Purchase+Frequency=%3E%3D0.005">3_제품 판매 현황</a>

        <a style="padding: 5px 15px; border-top: solid 1px #4285F4; border-left: solid 1px #4285F4; border-right: solid 1px #4285F4; border-radius: 5px 5px 0 0; float: left; line-height: 40px; font-weight: bold; background-color: #eaf1fe;"   href="/dashboards/Looker_Demo_call_center::agent_performance?Agent=Tonya+Koop">4_상담원 평가</a>

      </nav>

      </div>
    row: 0
    col: 0
    width: 24
    height: 2
  filters:
  - name: 상담원 명
    title: 상담원 명
    type: field_filter
    default_value: Tonya Koop
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: Looker_Demo_call_center
    explore: transcript
    listens_to_filters: []
    field: agents.name
  - name: 기간
    title: 기간
    type: field_filter
    default_value: 2022/01/01 to 2022/06/21
    allow_multiple_values: true
    required: false
    ui_config:
      type: day_range_picker
      display: inline
      options: []
    model: Looker_Demo_call_center
    explore: transcript
    listens_to_filters: []
    field: transcript.conversation_start_date
