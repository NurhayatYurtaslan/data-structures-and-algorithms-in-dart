void main() {
  // Construct the widget tree
  var widgetTree = Column(children: [
    Padding(
      padding: 8,
      child: Text('Hello, World!'),
    ),
    Column(children: [
      Text('Nested Column 1'),
      Padding(
        padding: 16,
        child: Text('Nested Padding'),
      ),
      Text('Nested Column 2'),
    ]),
    Text('Goodbye!'),
  ]);

  // Print the widget tree
  print(widgetTree.render());
}

abstract class WidgetNode {
  String render({int indentLevel = 0});
}

class Text extends WidgetNode {
  final String data;

  Text(this.data);

  @override
  String render({int indentLevel = 0}) {
    return '${'  ' * indentLevel}Text("$data")';
  }
}

class Padding extends WidgetNode {
  final int padding;
  final WidgetNode child;

  Padding({required this.padding, required this.child});

  @override
  String render({int indentLevel = 0}) {
    var indent = '  ' * indentLevel;
    return '''
${indent}Padding(padding: $padding)
${child.render(indentLevel: indentLevel + 1)}''';
  }
}

class Column extends WidgetNode {
  final List<WidgetNode> children;

  Column({required this.children});

  @override
  String render({int indentLevel = 0}) {
    var indent = '  ' * indentLevel;
    var renderedChildren = children
        .map((child) => child.render(indentLevel: indentLevel + 1))
        .join('\n');
    return '''
${indent}Column(
$renderedChildren
${indent})''';
  }
}
