PORTNAME=	boost-docs
COMMENT=	Documentation for libraries from boost.org
WWW=		https://www.boost.org/

LICENSE=	boost
LICENSE_FILE=	${WRKSRC}/LICENSE_1_0.txt

USES=	python:env shebangfix

DOCSDIR=	${PREFIX}/share/doc/boost
UNIQ=		/usr/bin/uniq

NO_ARCH=	yes
NO_BUILD=	yes

OPTIONS_DEFINE=	DOCS

SHEBANG_GLOB=	*.py

PORTDOCS=	*

.include "${.CURDIR}/../boost-all/common.mk"

do-install:
# Documentation & examples
	@${MKDIR} ${DOCSDIR}

	@cd ${WRKSRC} &&\
	${FIND} . -name "*.htm" -o -name "*.html"  -o -name "*.css"\
		-o -name "*.jp*g" -o -name "*.png" -o -name "*.gif"\
		| ${PAX} -rw ${DOCSDIR}
	@cd ${WRKSRC}/libs &&\
	${FIND} . -name "example" -o -name "examples" -o -name "*example*.cpp"\
		-o -name "*example*.c" -o -name "*example*.hpp" | ${UNIQ} |\
		${GREP} -v "assign/test" | ${GREP} -v "iterator/test" | \
		${GREP} -v "range/test" |\
		${PAX} -rw ${DOCSDIR}/libs

.include <bsd.port.mk>
