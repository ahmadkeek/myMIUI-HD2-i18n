.class Lcom/android/settings/StatusBarToggleArrangement$3;
.super Ljava/lang/Object;
.source "StatusBarToggleArrangement.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemLongClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/settings/StatusBarToggleArrangement;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/settings/StatusBarToggleArrangement;


# direct methods
.method constructor <init>(Lcom/android/settings/StatusBarToggleArrangement;)V
    .locals 0
    .parameter

    .prologue
    .line 79
    iput-object p1, p0, Lcom/android/settings/StatusBarToggleArrangement$3;->this$0:Lcom/android/settings/StatusBarToggleArrangement;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemLongClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)Z
    .locals 2
    .parameter
    .parameter "view"
    .parameter "position"
    .parameter "id"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)Z"
        }
    .end annotation

    .prologue
    .line 82
    .local p1, parent:Landroid/widget/AdapterView;,"Landroid/widget/AdapterView<*>;"
    const-wide/16 v0, 0x0

    cmp-long v0, p4, v0

    if-eqz v0, :cond_0

    .line 83
    iget-object v0, p0, Lcom/android/settings/StatusBarToggleArrangement$3;->this$0:Lcom/android/settings/StatusBarToggleArrangement;

    #getter for: Lcom/android/settings/StatusBarToggleArrangement;->mToggleManager:Landroid/util/ToggleManager;
    invoke-static {v0}, Lcom/android/settings/StatusBarToggleArrangement;->access$200(Lcom/android/settings/StatusBarToggleArrangement;)Landroid/util/ToggleManager;

    move-result-object v0

    long-to-int v1, p4

    invoke-virtual {v0, v1}, Landroid/util/ToggleManager;->startLongClickAction(I)Z

    move-result v0

    .line 85
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
