/**
 * 图表连线
 * @author yangsisiv5@126.com
 */
var Chat = (function () {
    var C = function (container) {
        this.container = $(container);
    };
    var _p = C.prototype;

    var leafClassName = 'chart-leaf',
        rootClassName = 'chart-root',
        lineClassName = 'chart-line';

    function getNode(container) {
        var leaf, root, rootPosition, leafPosition = [];
        leaf = container.find('.' + leafClassName);
        root = container.find('.' + rootClassName)[0];
        leaf.each(function (i, item) {
            leafPosition.push(getPosition(item));
        });
        rootPosition = getPosition(root);
        return {
            rootPosition: rootPosition,
            leafPosition: $(leafPosition),
            leaf: leaf
        }
    }

    function getMiddlePosition(a, b) {
        return Math.ceil((a + b) / 2);
    }

    function getMiddlePoint(start, end) {
        return [getMiddlePosition(start[0], end[0]),
            getMiddlePosition(start[1], end[1])];
    }

    function getPosition(ele) {
        var top, left, width, height, p = [];
        ele = $(ele);
        top = ele.position().top;
        left = ele.position().left;
        width = ele.innerWidth();
        height = ele.innerHeight();
        p[0] = [left, top];
        p[1] = [left + width, top];
        p[2] = [left + width, top + height];
        p[3] = [left, top + height];
        return p;
    }

    function drawLine(start, end) {
        var width, height;
        width = Math.abs((end[0] - start[0]) || 1);
        height = Math.abs((end[1] - start[1]) || 1);
        return '<div class="' + lineClassName + '" style="width:' + width
            + 'px; height:' + height
            + 'px; top:' + start[1]
            + 'px; left:' + start[0]
            + 'px;"></div>';
    }

    function draw(html, container) {
        container.append(html.join(' '));
    }

    _p.drawLevel = function () {
        var nodes, rootPosition, leafPosition, rootStart, rootEnd,
            leafStarts = [], html = [];
        nodes = getNode(this.container);
        rootPosition = nodes.rootPosition;
        leafPosition = nodes.leafPosition;

        rootStart = getMiddlePoint(rootPosition[2], rootPosition[3]);
        rootEnd = getMiddlePoint(rootStart, [rootStart[0], leafPosition[0][1][1]]);
        html.push(drawLine(rootStart, rootEnd));

        leafPosition.each(function (i, ele) {
            var end = getMiddlePoint(ele[0], ele[1]);
            var start = [end[0], rootEnd[1]];
            html.push(drawLine(start, end));
            leafStarts.push(start);
        });
        html.push(drawLine(leafStarts[0], leafStarts.pop()));
        draw(html, this.container);
    };
    _p.drawVertical = function () {
        var nodes, rootPosition, leafPosition, rootStart, rootEnd,
            leaves = [], html = [];
        nodes = getNode(this.container);
        rootPosition = nodes.rootPosition;
        leafPosition = nodes.leafPosition;

        for (var i = 0; i < leafPosition.length; i++) {
            var right = leafPosition[i];
            var left = leafPosition[++i];
            var end, start;
            if (left && right) {
                end = getMiddlePoint(right[0], right[3]);
                start = getMiddlePoint(left[1], left[2]);
                html.push(drawLine(start, end));
                leaves.push([start, end]);
            } else if (right) {
                left = right;
                start = getMiddlePoint(left[1], left[2]);
                end = [getMiddlePoint.apply(this, leaves.slice(-1)[0])[0], start[1]];
                html.push(drawLine(start, end));
                rootEnd = end;
            }
        }
        rootStart = getMiddlePoint(rootPosition[2], rootPosition[3]);
        !rootEnd && (rootEnd = getMiddlePoint.apply(this, leaves.pop()));
        html.push(drawLine(rootStart, rootEnd));
        draw(html, this.container);
    };
    _p.drawLeft = function () {
        var nodes, rootPosition, leafPosition, rootStart, rootEnd, rootStartX,
            leafEnds = [], html = [];
        nodes = getNode(this.container);
        rootPosition = nodes.rootPosition;
        leafPosition = nodes.leafPosition;

        rootStartX = rootPosition[2][0] - 5;
        leafPosition.each(function (i, ele) {
            var start = getMiddlePoint(ele[1], ele[2]);
            var end = [rootStartX, start[1]];
            html.push(drawLine(start, end));
            leafEnds.push(end);
        });

        rootStart = [rootStartX, rootPosition[2][1]];
        rootEnd = leafEnds.pop();
        html.push(drawLine(rootStart, rootEnd));
        draw(html, this.container);
    };
    _p.drawRight = function () {
        var nodes, rootPosition, leafPosition, rootStart, rootEnd, rootStartX,
            leafStarts = [], html = [];
        nodes = getNode(this.container);
        rootPosition = nodes.rootPosition;
        leafPosition = nodes.leafPosition;

        rootStartX = rootPosition[3][0] + 5;
        leafPosition.each(function (i, ele) {
            var end = getMiddlePoint(ele[0], ele[3]);
            var start = [rootStartX, end[1]];
            html.push(drawLine(start, end));
            leafStarts.push(start);
        });

        rootStart = [rootStartX, rootPosition[3][1]];
        rootEnd = leafStarts.pop();
        html.push(drawLine(rootStart, rootEnd));
        draw(html, this.container);
    };
    return C;
})();