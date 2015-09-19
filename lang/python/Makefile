# $MidnightBSD$

PORTNAME=	python
PORTVERSION=	${PYTHON_DEFAULT}
PORTREVISION=	1
PORTEPOCH=	2
CATEGORIES=	lang python ipv6
MASTER_SITES=	# empty
DISTFILES=	# empty
EXTRACT_ONLY=	# empty

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The "meta-port" for the default version of Python interpreter
LICENSE=	python

NO_BUILD=	yes
USES=		python:run

PLIST_FILES=	bin/2to3 \
		bin/idle \
		bin/pydoc \
		bin/python \
		bin/python-config \
		bin/python-shared \
		bin/python-shared-config

.include <bsd.port.pre.mk>

.if ${PYTHON_MAJOR_VER} == 2
RUN_DEPENDS+=	python2:${PORTSDIR}/lang/python2
PLIST_FILES+=	bin/smtpd.py
.elif ${PYTHON_MAJOR_VER} == 3
RUN_DEPENDS+=	python3:${PORTSDIR}/lang/python3
.endif

do-install:
.for file in python python-shared
	${LN} -sf ${file}${PYTHON_MAJOR_VER} ${STAGEDIR}${PREFIX}/bin/${file}
.endfor
	${LN} -sf 2to3-${PYTHON_MAJOR_VER} ${STAGEDIR}${PREFIX}/bin/2to3
.if ${PYTHON_MAJOR_VER} == 2
	${LN} -sf smtpd${PYTHON_MAJOR_VER}.py ${STAGEDIR}${PREFIX}/bin/smtpd.py
.for file in idle pydoc
	${LN} -sf ${file}${PYTHON_MAJOR_VER} ${STAGEDIR}${PREFIX}/bin/${file}
.endfor
.elif ${PYTHON_MAJOR_VER} == 3
.for file in idle pydoc
	${LN} -sf ${file}${PYTHON_MAJOR_VER}-${PYTHON_VER} \
		${STAGEDIR}${PREFIX}/bin/${file}
.endfor
.endif
	${LN} -sf python${PYTHON_MAJOR_VER}-config \
		${STAGEDIR}${PREFIX}/bin/python-config
	${LN} -sf python-shared${PYTHON_MAJOR_VER}-config \
		${STAGEDIR}${PREFIX}/bin/python-shared-config

# Major upgrade support
PORTUPGRADE_CMD?=	${LOCALBASE}/sbin/portupgrade
PKG_WHICH_CMD?=	${LOCALBASE}/sbin/pkg_which
upgrade-site-packages:
	@if [ ! -x ${PORTUPGRADE_CMD} ]; then \
		${ECHO_MSG} "Please install ports-mgmt/portupgrade."; \
		${FALSE}; \
	 fi

	@for ver in `echo ${_PYTHON_ALLBRANCHES}|${SED} 's/${PYTHON_VER}//'`; do \
		if [ -d ${PREFIX}/lib/python$$ver ]; then \
			UPD=`${FIND} ${PREFIX}/lib/python$$ver \
					-type f -print0 | \
				${XARGS} -0 ${PKG_WHICH_CMD} | \
				${GREP} -Fv '?' | \
				${EGREP} -v '^python2?[0-5]?-2' | \
				${SORT} -u`; \
			if [ "$$UPD" ]; then \
				${PORTUPGRADE_CMD} -f $$UPD; \
			fi; \
		fi; \
	 done \

.include <bsd.port.post.mk>
