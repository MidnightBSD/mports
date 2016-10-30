# $MidnightBSD$

PORTNAME=	Cflow
PORTVERSION=	1.053
PORTREVISION=	1
CATEGORIES=	net-mgmt perl5
MASTER_SITES=	http://net.doit.wisc.edu/~plonka/Cflow/ \
		http://net.doit.wisc.edu/~plonka/Cflow/old/
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Analyze raw flow files written by cflowd (Cisco NetFlow data)
LICENSE=	gpl2

OPTIONS_DEFINE=	FLOW_TOOLS
FLOW_TOOLS_DESC=	Enable flow-tools support

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MFLOW_TOOLS}
BUILD_DEPENDS+=	${LOCALBASE}/lib/libft.a:${PORTSDIR}/net-mgmt/flow-tools
RUN_DEPENDS+=	${LOCALBASE}/lib/libft.a:${PORTSDIR}/net-mgmt/flow-tools

CFLAGS+=	-I${LOCALBASE}/include -DOSU
CONFIGURE_ARGS+=	\
	"LDDLFLAGS= -shared -L${LOCALBASE}/lib -lft -lz" \
	"INC= -I${LOCALBASE}/include" "LDLOADLIBS= -L${LOCALBASE}/lib -lft -lz"
.endif
PERL_CONFIGURE=	YES

.include <bsd.port.mk>
