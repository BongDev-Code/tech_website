import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isMissionExpanded = false;
  bool _isHowItWorksExpanded = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Back Button
            Padding(
              padding: const EdgeInsets.only(top: 48, left: 16),
              child: Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    colorScheme.primary,
                    colorScheme.secondary,
                  ],
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 32),
                  Text(
                    'TechBridgeSA',
                    style: theme.textTheme.headlineLarge?.copyWith(
                      color: Colors.white,
                      fontSize: 48,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    "Building South Africa's Future through Tech Education",
                    style: theme.textTheme.headlineMedium?.copyWith(
                      color: Colors.white,
                      height: 1.3,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Empowering learners and employing graduates through coding, robotics, and innovation.',
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: Colors.white.withOpacity(0.9),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 16,
                    runSpacing: 16,
                    children: [
                      _actionButton(
                        context,
                        'Join as a School',
                        colorScheme.tertiary,
                        () => Navigator.pushNamed(context, '/join-school'),
                      ),
                      _actionButton(
                        context,
                        'Sponsor a Graduate',
                        colorScheme.secondary,
                        () => Navigator.pushNamed(context, '/sponsor-graduate'),
                      ),
                      _actionButton(
                        context,
                        'Volunteer or Partner',
                        colorScheme.primary,
                        () =>
                            Navigator.pushNamed(context, '/volunteer-partner'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _isMissionExpanded = !_isMissionExpanded;
                              });
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 500),
                              child: _infoCard(
                                context,
                                'Our Mission',
                                'TechBridgeSA bridges the digital divide by training unemployed graduates to deliver future-focused tech education in underserved schools.',
                                Icons.rocket_launch,
                                isExpanded: _isMissionExpanded,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 24),
                      Expanded(
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _isHowItWorksExpanded = !_isHowItWorksExpanded;
                              });
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 500),
                              child: _infoCard(
                                context,
                                'How It Works',
                                'Graduates are trained in coding, robotics, and facilitation skills. They are deployed to local schools, where they run hybrid programs for learners.',
                                Icons.architecture,
                                isExpanded: _isHowItWorksExpanded,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 48),
                  Text(
                    'Our Programs',
                    style: theme.textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 16,
                    runSpacing: 16,
                    children: [
                      _programCard(context, 'Coding Clubs',
                          'Python, Scratch, HTML', Icons.code),
                      _programCard(
                          context, 'Robotics', 'Arduino/LEGO', Icons.smart_toy),
                      _programCard(context, 'Career Discovery',
                          'Digital Skills & Mentorship', Icons.work),
                    ],
                  ),
                  const SizedBox(height: 48),
                  Container(
                    padding: const EdgeInsets.all(32),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          colorScheme.primary.withOpacity(0.1),
                          colorScheme.secondary.withOpacity(0.1),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Get Involved',
                          style: theme.textTheme.headlineMedium,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Partner with us to build digital skills and change lives.',
                          style: theme.textTheme.bodyLarge,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 24),
                        Wrap(
                          alignment: WrapAlignment.center,
                          spacing: 16,
                          runSpacing: 16,
                          children: [
                            _actionButton(
                              context,
                              'Partner as a School',
                              colorScheme.tertiary,
                              () => Navigator.pushNamed(
                                  context, '/partner-school'),
                            ),
                            _actionButton(
                              context,
                              'Fund a Tech Lab',
                              colorScheme.secondary,
                              () => Navigator.pushNamed(
                                  context, '/fund-tech-lab'),
                            ),
                            _actionButton(
                              context,
                              'Hire Our Graduates',
                              colorScheme.primary,
                              () => Navigator.pushNamed(
                                  context, '/hire-graduates'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 48),
                  Center(
                    child: Text(
                      '© ${DateTime.now().year} TechBridgeSA | Contact us: hello@techbridgesa.org',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _actionButton(
    BuildContext context,
    String text,
    Color color,
    VoidCallback onPressed,
  ) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          elevation: 4,
        ).copyWith(
          elevation: WidgetStateProperty.resolveWith<double>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.hovered)) {
                return 8;
              }
              return 4;
            },
          ),
        ),
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }

  Widget _infoCard(
    BuildContext context,
    String title,
    String description,
    IconData icon, {
    bool isExpanded = false,
  }) {
    final theme = Theme.of(context);
    return Card(
      elevation: isExpanded ? 8 : 4,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        padding: EdgeInsets.all(isExpanded ? 32 : 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  icon,
                  size: 32,
                  color: theme.colorScheme.primary,
                ),
                Icon(
                  isExpanded ? Icons.expand_less : Icons.expand_more,
                  color: theme.colorScheme.primary,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: theme.textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: theme.textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }

  Widget _programCard(
    BuildContext context,
    String title,
    String subtitle,
    IconData icon,
  ) {
    final theme = Theme.of(context);
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Card(
        elevation: 4,
        child: Container(
          width: 280,
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Text(
                title,
                style: theme.textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                subtitle,
                style: theme.textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
