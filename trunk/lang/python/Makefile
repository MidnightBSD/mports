# $MidnightBSD: mports/lang/python/Makefile,v 1.9 2009/05/08 16:11:20 laffer1 Exp $

PORTNAME=	python
PORTVERSION=	${PYTHON_VER}
PORTEPOCH=	2
CATEGORIES=	lang python ipv6
MASTER_SITES=	# empty
DISTFILES=	# empty
EXTRACT_ONLY=	# empty

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	The "meta-port" for the default version of Python interpreter
LICENSE=	python

USE_PYTHON_RUN=	yes
PYTHON_VERSION=	${PYTHON_DEFAULT_VERSION}
NO_BUILD=	yes

do-install:
	@${DO_NADA}

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

.include <bsd.port.mk>
